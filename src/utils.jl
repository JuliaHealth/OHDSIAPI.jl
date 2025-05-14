"""

    _write_metadata_entry!(metadata::Dict{String, Any}, id::Int, version::Int, last_modified::String)

Adds or updates an entry for a cohort in the metadata dictionary.

# Arguments

- `metadata::Dict{String, Any}` - The metadata dictionary to mutate.
- `id::Int` - The cohort ID.
- `version::Int` - The cohort version number.
- `last_modified::String` - The last modified timestamp for the cohort.

# Returns

Nothing. Mutates the input dictionary in-place.

"""
function _write_metadata_entry!(
    metadata::Dict{String, Any},
    id::Int,
    version::Int,
    last_modified::String
)
    metadata[string(id)] = Dict(
        "id" => id,
        "version" => version,
        "lastModified" => last_modified,
        "downloadedAt" => string(Dates.now())
    )
end

"""

    _save_metadata(metadata::Dict{String, Any}, metadata_path::String)

Saves the metadata dictionary to a JSON file at the specified path.

# Arguments

- `metadata::Dict{String, Any}` - The metadata dictionary to save.
- `metadata_path::String` - The path to the output JSON file.

# Returns

Nothing. Writes the file as a side effect.

"""
function _save_metadata(
    metadata::Dict{String, Any},
    metadata_path::String
)
    open(metadata_path, "w") do file
        JSON3.pretty(file, metadata, JSON3.AlignmentContext(indent=4))
    end
end

"""

    _save_cohort_json(id::Int, body, save_dir::String)

Saves the cohort JSON body to a file named `<id>.json` in the specified directory.

# Arguments

- `id::Int` - The cohort ID (used as the filename).
- `body` - The JSON content to write.
- `save_dir::String` - The directory to save the file in.

# Returns

The full path to the saved JSON file as a String.

"""
function _save_cohort_json(
    id::Int,
    body,
    save_dir::String
)
    path = joinpath(save_dir, "$(id).json")
    open(path, "w") do file
        JSON3.pretty(file, body, JSON3.AlignmentContext(indent=4))
    end
    return path
end

"""

    get_cohort_definition(IDs; progress_bar::Bool=true, metadata_check::Bool=true, output_dir::String=pwd())

Downloads one or more cohort definitions from the OHDSI WebAPI and saves them as JSON files in the specified directory. Metadata about the downloads is tracked in a `metadata.json` file. If `metadata_check` is enabled, cohorts that are already up-to-date will be skipped.

# Arguments

- `IDs` - A single integer ID or a collection of IDs to download.
- `progress_bar::Bool` - Whether to display a progress bar (default: true).
- `metadata_check::Bool` - Whether to check metadata and skip up-to-date cohorts (default: true).
- `output_dir::String` - Directory to save the cohort JSON files and metadata (default: current directory).

# Returns

A vector of file paths to the downloaded cohort JSON files.

# Examples

```julia-repl
julia> get_cohort_definition(12345)
julia> get_cohort_definition([12345, 67890]; output_dir="./cohorts")
```

"""
function get_cohort_definition(
    IDs;
    progress_bar::Bool = true,
    metadata_check::Bool = true,
    output_dir::String = pwd()
)
    metadata_path = joinpath(output_dir, "metadata.json")
    metadata = if metadata_check && isfile(metadata_path)
        JSON3.read(read(metadata_path, String), Dict{String, Any})
    else
        Dict{String, Any}()
    end

    ids = typeof(IDs) <: Integer ? [IDs] : IDs
    download_paths = String[]

    if progress_bar
        p = Progress(length(ids); dt=0.5, barglyphs=BarGlyphs("[=> ]"), barlen=50, color=:yellow)
    end

    for id in ids
        try
            existing_info = get(metadata, string(id), nothing)

            version_resp = get_cohortdefinition_version(id)
            if version_resp.status != 200
                @warn "Could not retrieve version info for cohort ID: $id"
                continue
            end
            versions = JSON3.read(String(version_resp.body))
            latest_version = maximum(x -> x["version"], versions)

            cohort_resp = get_cohortdefinition(id)
            if cohort_resp.status != 200
                @warn "Failed to download cohort ID: $id"
                continue
            end

            cohort_json = JSON3.read(String(cohort_resp.body))
            ms = cohort_json["modifiedDate"]
            date = Dates.unix2datetime(ms ÷ 1000)
            last_modified = Dates.format(date, "yyyy-mm-ddTHH:MM:SS")

            if metadata_check && existing_info !== nothing && existing_info["lastModified"] == last_modified
                @info "Skipping cohort ID $id (no changes detected, up-to-date)"
                if progress_bar
                    next!(p)
                end
                continue
            end

            path = _save_cohort_json(id, cohort_json, output_dir)
            _write_metadata_entry!(metadata, id, latest_version, last_modified)
            push!(download_paths, path)
            @info "Cohort definition $id downloaded to $(path)"

        catch e
            @warn "Error processing cohort ID $id: $(e)"
            continue
        end

        if progress_bar
            next!(p)
        end
    end

    if metadata_check
        _save_metadata(metadata, metadata_path)
    end

    return download_paths
end
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
    download_cohort_definition(IDs; metadata::Union{String,Nothing}="./data/cohorts/cohort_information.json", output_dir::String=pwd())

Minimal version of cohort definition downloader. Skips verbose output and progress bar.

# Arguments
- `IDs`: Integer or iterable of cohort IDs.
- `metadata`: Metadata file path (default is `./data/cohorts/cohort_information.json`). If `""`, no metadata check or save is performed.
- `output_dir`: Directory to save cohort files.

# Returns
- Vector of downloaded cohort JSON paths.
"""
function download_cohort_definition(
    IDs;
    metadata::Union{String,Nothing} = "./data/cohorts/cohort_information.json",
    output_dir::String = pwd()
)
    metadata_path = metadata == "" ? nothing : metadata
    metadata_dict = metadata_path !== nothing && isfile(metadata_path) ?
        JSON3.read(read(metadata_path, String), Dict{String, Any}) :
        Dict{String, Any}()

    ids = unique(typeof(IDs) <: Integer ? [IDs] : IDs)
    download_ids = Int[]

    for id in ids
        cohort_resp = get_cohortdefinition(id)
        if cohort_resp.status != 200
            continue
        end

        cohort_json = JSON3.read(String(cohort_resp.body))
        if !haskey(cohort_json, "modifiedDate")
            continue
        end

        ms = cohort_json["modifiedDate"]
        date = Dates.unix2datetime(ms ÷ 1000)
        last_modified = Dates.format(date, "yyyy-mm-ddTHH:MM:SS")

        if metadata_path !== nothing && haskey(metadata_dict, string(id)) &&
           metadata_dict[string(id)]["lastModified"] == last_modified
            continue 
        end

        push!(download_ids, id)
    end

    download_paths = String[]

    for id in download_ids
        try
            cohort_resp = get_cohortdefinition(id)
            cohort_json = JSON3.read(String(cohort_resp.body))
            if !haskey(cohort_json, "modifiedDate")
                continue
            end

            ms = cohort_json["modifiedDate"]
            date = Dates.unix2datetime(ms ÷ 1000)
            last_modified = Dates.format(date, "yyyy-mm-ddTHH:MM:SS")

            version_resp = get_cohortdefinition_version(id)
            versions = JSON3.read(String(version_resp.body))
            latest_version = maximum(x -> x["version"], versions)

            path = _save_cohort_json(id, cohort_json, output_dir)

            if metadata_path !== nothing
                _write_metadata_entry!(metadata_dict, id, latest_version, last_modified)
            end

            push!(download_paths, path)
        catch
            continue
        end
    end

    if metadata_path !== nothing
        mkpath(dirname(metadata_path))
        _save_metadata(metadata_dict, metadata_path)
    end

    return download_paths
end

"""
    download_cohort_definition(IDs; progress_bar::Bool=true, verbose::Bool=true, metadata::Union{String,Nothing}="./data/cohorts/cohort_information.json", output_dir::String=pwd())

Verbose version of the cohort downloader with progress bar and logging.

# Arguments
- `IDs`: Integer or iterable of cohort IDs.
- `progress_bar`: Show progress bar.
- `verbose`: Show `@info` messages.
- `metadata`: Metadata file path. If `""`, skip metadata check and saving.
- `output_dir`: Directory to save downloaded JSON files.

# Returns
- Vector of downloaded cohort JSON paths.
"""
function download_cohort_definition(
    IDs;
    progress_bar::Bool = true,
    verbose::Bool = true,
    metadata::Union{String,Nothing} = "./data/cohorts/cohort_information.json",
    output_dir::String = pwd()
)
    metadata_path = metadata == "" ? nothing : metadata
    metadata_dict = metadata_path !== nothing && isfile(metadata_path) ?
        JSON3.read(read(metadata_path, String), Dict{String, Any}) :
        Dict{String, Any}()

    ids = unique(typeof(IDs) <: Integer ? [IDs] : IDs)
    download_ids = Int[]
    skip_ids = Int[]

    for id in ids
        existing_info = get(metadata_dict, string(id), nothing)

        version_resp = get_cohortdefinition_version(id)
        if version_resp.status != 200
            @warn "Could not retrieve version info for cohort ID: $id"
            continue
        end
        versions = JSON3.read(String(version_resp.body))
        if isempty(versions)
            @warn "No versions found for cohort ID: $id"
            continue
        end
        latest_version = maximum(x -> x["version"], versions)

        cohort_resp = get_cohortdefinition(id)
        if cohort_resp.status != 200
            @warn "Failed to download cohort ID: $id"
            continue
        end
        cohort_json = JSON3.read(String(cohort_resp.body))
        if !haskey(cohort_json, "modifiedDate")
            @warn "No modifiedDate found for cohort ID: $id, skipping."
            continue
        end

        ms = cohort_json["modifiedDate"]
        date = Dates.unix2datetime(ms ÷ 1000)
        last_modified = Dates.format(date, "yyyy-mm-ddTHH:MM:SS")

        if existing_info !== nothing && existing_info["lastModified"] == last_modified
            if verbose
                @info "Skipping cohort ID $id (no changes detected, up-to-date)"
            end
            push!(skip_ids, id)
        else
            push!(download_ids, id)
        end
    end

    p = (progress_bar && !isempty(download_ids)) ?
    Progress(
        length(download_ids);
        dt=0.1,
        barglyphs=BarGlyphs("[=> ]"),
        barlen=40,
        color=:yellow
    ) :
    nothing

    download_paths = String[]

    for id in download_ids
        try
            cohort_resp = get_cohortdefinition(id)
            cohort_json = JSON3.read(String(cohort_resp.body))

            if !haskey(cohort_json, "modifiedDate")
                @warn "No modifiedDate found for cohort ID: $id, skipping."
                continue
            end

            ms = cohort_json["modifiedDate"]
            date = Dates.unix2datetime(ms ÷ 1000)
            last_modified = Dates.format(date, "yyyy-mm-ddTHH:MM:SS")

            version_resp = get_cohortdefinition_version(id)
            versions = JSON3.read(String(version_resp.body))
            latest_version = maximum(x -> x["version"], versions)

            path = _save_cohort_json(id, cohort_json, output_dir)
            _write_metadata_entry!(metadata_dict, id, latest_version, last_modified)
            push!(download_paths, path)

            if verbose
                @info "Downloaded cohort $id: $(abspath(path))"
            end
            if progress_bar
                next!(p; showvalues=[("Downloaded cohort", "$id")])
            end
        catch e
            @warn "Error downloading cohort ID $id: $e"
            continue
        end
    end

    if metadata_path !== nothing
        mkpath(dirname(metadata_path))
        _save_metadata(metadata_dict, metadata_path)
    end

    if verbose && !isempty(download_paths)
        filenames = join([split(path, r"[\\/]") |> last for path in download_paths], "\n  ")
        @info "Successfully downloaded the following cohorts:\n  $filenames"
    elseif verbose
        @info "No new cohorts were downloaded."
    end

    return download_paths
end

export download_cohort_definition
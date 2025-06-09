"""
    download_cohort_definition(IDs; progress_bar::Bool = true, verbose::Bool = true, metadata::Union{String,Nothing} = "cohort_information.json", output_dir::String = pwd())

Download cohort definitions from an OHDSI WebAPI instance. This function handles downloading cohort definitions,
tracking metadata about downloaded cohorts, and only re-downloading when updates are available.

### Arguments

- `IDs`: Integer or iterable of cohort definition IDs.
- `progress_bar::Bool`: Whether to show a progress bar during downloads.
- `verbose::Bool`: Whether to print logging messages.
- `metadata::Union{String,Nothing}`: Path to metadata JSON file. If `""`, disables metadata logic.
- `output_dir::String`: Directory to store cohort JSON files.

### Returns

- A vector of file paths to successfully downloaded cohort definition JSONs.

### Examples

Download a single cohort definition:

```julia-repl
julia> cohort_files = download_cohort_definition(1792956)
```

Download multiple cohorts with custom options:

```julia-repl
julia> cohort_ids = [1792956, 1790632]
julia> cohort_files = download_cohort_definition(
           cohort_ids,
           progress_bar=true,
           verbose=true,
           metadata="my_metadata.json",
           output_dir="./cohorts"
       )
```
"""
function download_cohort_definition(
    IDs;
    progress_bar::Bool = true,
    verbose::Bool = true,
    metadata::Union{String,Nothing} = "cohort_information.json",
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

    p = (progress_bar && !isempty(download_ids)) ? Progress(
        length(download_ids);
        dt=0.1,
        barglyphs=BarGlyphs("[=> ]"),
        barlen=40,
        color=:yellow
    ) : nothing

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
            if metadata_path !== nothing
                _write_metadata_entry!(metadata_dict, id, latest_version, last_modified)
            end
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

function download_concept_set(
    IDs;
    progress_bar::Bool = true,
    output_dir::String = pwd(),
    deflate::Bool = true
)

    p = progress_bar ?
    Progress(
        length(IDs);
        dt=0.1,
        barglyphs=BarGlyphs("[=> ]"),
        barlen=40,
        color=:yellow
    ) :
    nothing

    download_paths = []
    for id in IDs
        cohort_resp = get_cohortdefinition(id)
        if cohort_resp.status != 200
            @warn "Failed to download concept set for cohort ID: $id"
            continue
        end

        try
            r = OHDSIAPI.get_cohortdefinition_export_conceptset(id)
            fname = split(r.headers[1][2], r"filename=")[2] |> x -> replace(x, "\"" => "")
            path = joinpath(output_dir, fname)

            open(path, "w") do f
                write(f, r.body)
            end

            @info "Downloaded conceptset for cohort ID: $id."
            if progress_bar
                next!(p; showvalues=[("Downloaded cohort", "$id")])
            end

            push!(download_paths, path)
        catch e
            @warn "Error downloading cohort ID $id: $e"
            continue
        end
    end

    paths = []
    if deflate
        for p in download_paths
            @info "Deflating $p."
            zarchive = ZipFile.Reader(p)

            for f in zarchive.files
                fpath = replace(p, "export.zip" => "")
                fpath = joinpath(output_dir, fpath * f.name)
                write(fpath, read(f))
                push!(paths, fpath)
            end

            close(zarchive)
            rm(p)
        end
        
    end

    return !isempty(paths) ? paths : download_paths 
end

export download_cohort_definition
export download_concept_set

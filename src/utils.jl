function _prepare_cohort_directory(
    path::String
)
    mkpath(path)
    return path
end

function _load_metadata(
    metadata_path::String,
    metadata_check::Bool
)
    if metadata_check && isfile(metadata_path)
        return JSON3.read(read(metadata_path, String), Dict{String, Any})
    end
    return Dict{String, Any}()
end

function _write_metadata_entry(
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

function _save_metadata(
    metadata::Dict{String, Any},
    metadata_path::String
)
    open(metadata_path, "w") do file
        JSON3.pretty(file, metadata, JSON3.AlignmentContext(indent=4))
    end
end

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

function _format_timestamp(
    ms::Int
)
    date = Dates.unix2datetime(ms ÷ 1000)
    return Dates.format(date, "yyyy-mm-ddTHH:MM:SS")
end

function get_cohort_definition(
    IDs;
    progress_bar::Bool = true,
    metadata_check::Bool = true,
    save_dir::String = pwd()
)
    save_dir = _prepare_cohort_directory(save_dir)
    metadata_path = joinpath(save_dir, "metadata.json")
    metadata = _load_metadata(metadata_path, metadata_check)

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
            last_modified = _format_timestamp(cohort_json["modifiedDate"])

            if metadata_check && existing_info !== nothing && existing_info["lastModified"] == last_modified
                @info "Skipping cohort ID $id (no changes detected, up-to-date)"
                if progress_bar
                    next!(p)
                end
                continue
            end

            path = _save_cohort_json(id, cohort_json, save_dir)
            _write_metadata_entry(metadata, id, latest_version, last_modified)
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
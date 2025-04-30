using HTTP
using JSON3
using Dates

function prepare_cohort_directory()
    path = joinpath(@__DIR__, "..", "data", "cohort_definitions")
    mkpath(path)
    return path
end

function load_metadata(
    metadata_path::String,
    metadata_check::Bool
)
    if metadata_check && isfile(metadata_path)
        return JSON3.read(read(metadata_path, String), Dict{String, Any})
    end
    return Dict{String, Any}()
end

function write_metadata_entry(
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

function save_metadata(
    metadata::Dict{String, Any},
    metadata_path::String
)
    open(metadata_path, "w") do file
        JSON3.pretty(file, metadata, JSON3.AlignmentContext(indent=4))
    end
end

function save_cohort_json(
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

function format_timestamp(
    ms::Int
)
    date = Dates.unix2datetime(ms ÷ 1000)
    return Dates.format(date, "yyyy-mm-ddTHH:MM:SS")
end

function get_cohort_definition(
    IDs;
    progress_bar::Bool = true,
    metadata_check::Bool = true
)
    save_dir = prepare_cohort_directory()
    metadata_path = joinpath(save_dir, "metadata.json")
    metadata = load_metadata(metadata_path, metadata_check)
    # print(metadata)

    ids = typeof(IDs) <: Integer ? [IDs] : IDs
    download_paths = String[]

    for id in ids
        try
            existing_info = get(metadata, string(id), nothing)
            # print(existing_info)
            
            version_resp = get_cohortdefinition_version(id)
            versions = JSON3.read(String(version_resp.body))
            latest_version = maximum(x -> x["version"], versions)            
                
            cohort_resp = get_cohortdefinition(id)
            if cohort_resp.status != 200
                @warn "Failed to download cohort ID: $id"
                continue
            end
            
            cohort_json = JSON3.read(String(cohort_resp.body))
            last_modified = format_timestamp(cohort_json["modifiedDate"])
            
            if metadata_check && existing_info !== nothing && existing_info["lastModified"] == last_modified
                @info "Skipping cohort ID $id (no changes detected)"
                continue
            end

            path = save_cohort_json(id, cohort_json, save_dir)
            push!(download_paths, path)
            @info "Cohort definition $id downloaded to /data/cohort_definitions/$id.json"
            if metadata_check
                write_metadata_entry(metadata, id, latest_version, last_modified)
            end
        catch e
            @warn "Error downloading cohort ID: $id: $e"
        end
    end

    if metadata_check
        save_metadata(metadata, metadata_path)
    end

    return download_paths
end
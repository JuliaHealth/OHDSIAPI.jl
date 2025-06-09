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


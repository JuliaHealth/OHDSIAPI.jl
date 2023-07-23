module OHDSIAPI

# Write your package code here.

module ATLAS

using HTTP 
using JSON3 

"""

get_atlas_concept(
    id::Int;
    isExcluded::Bool = false,
    includeDescendants::Bool = true,
    includeMapped::Bool = true
)

Takes a valid OMOP Concept ID and returns vocabulary concept data.

# Arguments

- `id::Int` - valid OMOP Concept ID
- `isExcluded::Bool` - Exclude this concept (and any of its descendants if selected) from the concept set
- `includeDescendants::Bool` - Consider not only this concept, but also all of its descendants
- `includeMapped::Bool` - Allow to search for non-standard concepts

# Returns

- `obj::JSON3.Object` - results in a JSON3 object representing the ATLAS concept

"""
function get_atlas_concept(
    id::String;
    isExcluded::Bool=false,
    includeDescendants::Bool=true,
    includeMapped::Bool=true
)
    try
        path = "https://atlas-demo.ohdsi.org/WebAPI/vocabulary/concept/" * id
        concept = HTTP.get(path) |> x -> String(x.body) |> JSON3.read
        obj = Dict(
            "items" => [
                Dict(
                    "concept" => concept,
                    "isExcluded" => isExcluded,
                    "includeDescendants" => includeDescendants,
                    "includeMapped" => includeMapped,
                ),
            ],
        )
        return JSON3.write(obj)
    catch
        return "NA"
    end

end

"""

get_atlas_conceptset(
    id::Int;
    isExcluded::Bool = false,
    includeDescendants::Bool = true,
    includeMapped::Bool = true
)

Takes a valid OMOP Concept ID and returns vocabulary concept data.

# Arguments

- `id::Int` - valid OMOP Concept ID
- `isExcluded::Bool` - Exclude this concept (and any of its descendants if selected) from the concept set
- `includeDescendants::Bool` - Consider not only this concept, but also all of its descendants
- `includeMapped::Bool` - Allow to search for non-standard concepts


# Returns
- `obj::JSON3.Object` - results in a JSON3 object representing the ATLAS conceptset

"""

function get_atlas_conceptset(
    id::String;
    isExcluded::Bool=false,
    includeDescendants::Bool=true,
    includeMapped::Bool=true
)
    try
        path = "https://atlas-demo.ohdsi.org/WebAPI/conceptset/" * id * "/expression" 
        conceptList = HTTP.get(path) |> x -> String(x.body) |> JSON3.read
        obj = Dict(
            "items" => [conceptList]
        )
        return JSON3.write(obj)
    catch
        return "NA"
    end

end

function get_atlas_conceptset(
    id::Int;
    isExcluded::Bool=false,
    includeDescendants::Bool=true,
    includeMapped::Bool=true
)
    get_atlas_conceptset(string(id); isExcluded, includeDescendants, includeMapped)
end

function get_atlas_concept(
    id::Int;
    isExcluded::Bool=false,
    includeDescendants::Bool=true,
    includeMapped::Bool=true
)
    get_atlas_concept(string(id); isExcluded, includeDescendants, includeMapped)
end

function get_concept_name(json)
    try
        content = JSON3.read(json).items[1]
        concept_name = content["concept"]["CONCEPT_NAME"]

        return concept_name
    catch
        return "NA"
    end
end

"""

get_atlas_cohort_definition(
    id::Int
)

Looks up a cohort definition based on its ID.

# Arguments

- `id::Int` - valid OMOP Concept ID

# Returns
- `obj::JSON3.Object` - results in a JSON3 object representing the ATLAS cohort definition

"""
function get_atlas_cohort_definition(
    id::String;
)
    try
        path = "https://atlas-demo.ohdsi.org/WebAPI/cohortdefinition/" * id
        conceptList = HTTP.get(path) |> x -> String(x.body) |> JSON3.read
        obj = Dict(
            "items" => [conceptList]
        )
        return JSON3.write(obj)
    catch
        return "NA"
    end

end

export get_atlas_concept, get_concept_name, get_atlas_conceptset, get_atlas_cohort_definition

end
end

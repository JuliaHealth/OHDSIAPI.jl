"""
```julia
post_vocabulary_lookup_identifiers(
  body,
)
```

Get concepts from concept identifiers (IDs) from the default vocabulary source

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_lookup_identifiers`.
"""
function post_vocabulary_lookup_identifiers(
  body,
)

    url_stub = "vocabulary/lookup/identifiers"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortdefinition_printfriendly_cohort(
  query,
  body,
)
```

Render a cohort expression in html or markdown form. This method calls out to the markdown renderer for CIRCE cohort expressions, and then converts to HTML if required. The response will contain the media type as TEXT_PLAIN or markdown, or TEXT_HTML for html. The body of the response is the print friendly content.

# Returns

- an HTTP response with the content, with the appropriate MediaType based on the format that was requested.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortdefinition_printfriendly_cohort`.
"""
function post_cohortdefinition_printfriendly_cohort(
  query,
  body,
)

    url_stub = "cohortdefinition/printfriendly/cohort"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_compare(
  body,
  sourceKey::String,
)
```

Compares two concept set expressions to find which concepts are shared or unique to each concept set for the selected vocabulary source.

# Arguments

- `sourceKey::String` - The source containing the vocabulary

# Returns

- A collection of concept set comparisons

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_compare`.
"""
function post_vocabulary_compare(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/compare"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_pathwayanalysis_bytags(
  body,
)
```

Get list of pathways with assigned tags

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_pathwayanalysis_bytags`.
"""
function post_pathwayanalysis_bytags(
  body,
)

    url_stub = "pathway-analysis/byTags"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_evidence_spontaneousreports(
  body,
  sourceKey::String,
)
```

Originally provided an summary from spontaneous reports from LAERTES

# Arguments

- `sourceKey::String` - The source key of the CEM daimon

# Returns

- A list of spontaneous report summaries

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_evidence_spontaneousreports`.
"""
function post_evidence_spontaneousreports(
  body,
  sourceKey::String,
)

    url_stub = "evidence/{sourceKey}/spontaneousreports"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_pathwayanalysis(
  id::Number,
)
```

Creates a copy of a pathway analysis. The new pathway will be a copy of the specified pathway analysis id, but won't contain any tag assignments.

# Arguments

- `id::Number` - the analysis to copy

# Returns

- The copied pathway analysis.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_pathwayanalysis`.
"""
function post_pathwayanalysis(
  id::Number,
)

    url_stub = "pathway-analysis/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_featureanalysis(
  body,
)
```

Create a new feature analysis

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_featureanalysis`.
"""
function post_featureanalysis(
  body,
)

    url_stub = "feature-analysis/"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_lookup_identifiers(
  body,
  sourceKey::String,
)
```

Get concepts from concept identifiers (IDs) from a specific source

# Arguments

- `sourceKey::String` - path parameter specifying the source key identifying the source to use for access to the set of vocabulary tables

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_lookup_identifiers`.
"""
function post_vocabulary_lookup_identifiers(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/lookup/identifiers"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortanalysis_preview(
  body,
)
```

Generates a preview of the cohort analysis SQL used to run the Cohort Analysis Job

# Returns

- - SQL for the given CohortAnalysisTask translated and rendered to the current dialect

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortanalysis_preview`.
"""
function post_cohortanalysis_preview(
  body,
)

    url_stub = "cohortanalysis/preview"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortanalysis(
  body,
)
```

Queues up a cohort analysis task, that generates and translates SQL for the given cohort definitions, analysis ids and concept ids

# Returns

- information about the Cohort Analysis Job

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortanalysis`.
"""
function post_cohortanalysis(
  body,
)

    url_stub = "cohortanalysis/"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_ir_design(
  body,
)
```



> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_ir_design`.
"""
function post_ir_design(
  body,
)

    url_stub = "ir/design"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_resolveconceptsetexpression(
  body,
  sourceKey::String,
)
```

Resolve a concept set expression into a collection of concept identifiers using the selected vocabulary source.

# Arguments

- `sourceKey::String` - The source containing the vocabulary

# Returns

- A collection of concept identifiers

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_resolveconceptsetexpression`.
"""
function post_vocabulary_resolveconceptsetexpression(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/resolveConceptSetExpression"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_evidence_druglabel(
  body,
  sourceKey::String,
)
```

Retrieves a list of RxNorm ingredients from the concept set and determines if we have label evidence for them.

# Arguments

- `sourceKey::String` - The source key of the CEM daimon

# Returns

- A list of evidence for the drug and HOI

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_evidence_druglabel`.
"""
function post_evidence_druglabel(
  body,
  sourceKey::String,
)

    url_stub = "evidence/{sourceKey}/druglabel"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_source_daimons_setpriority(
  sourceKey::String,
  daimonType::String,
)
```

Set priority of daimon Set the priority of the specified daimon of the specified source, and set the other daimons to 0.

# Arguments

- `sourceKey::String` - 

- `daimonType::String` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_source_daimons_setpriority`.
"""
function post_source_daimons_setpriority(
  sourceKey::String,
  daimonType::String,
)

    url_stub = "source/{sourceKey}/daimons/{daimonType}/set-priority"
    args = Dict(
        "sourceKey" => sourceKey,
        "daimonType" => daimonType,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_lookup_mapped(
  body,
  sourceKey::String,
)
```

Get concepts mapped to the selected concept identifiers from a specific source. Find all concepts mapped to the concept identifiers provided. This end-point will check the CONCEPT, CONCEPT_RELATIONSHIP and SOURCE_TO_CONCEPT_MAP tables.

# Arguments

- `sourceKey::String` - path parameter specifying the source key identifying the source to use for access to the set of vocabulary tables

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_lookup_mapped`.
"""
function post_vocabulary_lookup_mapped(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/lookup/mapped"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_user_import_mapping(
  body,
  type::String,
)
```



# Arguments

- `type::String` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_user_import_mapping`.
"""
function post_user_import_mapping(
  body,
  type::String,
)

    url_stub = "user/import/{type}/mapping"
    args = Dict(
        "type" => type,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_evidence_evidencesearch(
  body,
  sourceKey::String,
)
```

Originally provided an evidence search from LAERTES

# Arguments

- `sourceKey::String` - The source key of the CEM daimon

# Returns

- A list of evidence

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_evidence_evidencesearch`.
"""
function post_evidence_evidencesearch(
  body,
  sourceKey::String,
)

    url_stub = "evidence/{sourceKey}/evidencesearch"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_lookup_identifiers_ancestors(
  body,
  sourceKey::String,
)
```

Calculates the full set of ancestor and descendant concepts for a list of ancestor and descendant concepts specified. This is used by ATLAS when navigating the list of included concepts in a concept set - the full list of ancestors (as defined in the concept set) and the descendants (those concepts included when resolving the concept set) are used to determine which descendant concepts share one or more ancestors.

# Arguments

- `sourceKey::String` - 

# Returns

- A map of the form: {id -> List<ascendant id>}

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_lookup_identifiers_ancestors`.
"""
function post_vocabulary_lookup_identifiers_ancestors(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/lookup/identifiers/ancestors"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_includedconcepts_count(
  body,
)
```

Resolve a concept set expression to get the count of included concepts using the default vocabulary source.

# Returns

- A count of included concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_includedconcepts_count`.
"""
function post_vocabulary_includedconcepts_count(
  body,
)

    url_stub = "vocabulary/included-concepts/count"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_pathwayanalysis_import(
  body,
)
```

Import a pathway analysis The imported analysis contains the cohort definitions referenced by the targets and event cohort paramaters. During import, any cohort definition not found (by a hash check) will be inserted into the database as a new cohort definition, and the cohort definition ids that are referenced will be updated to reflect the new cohort definition ids.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_pathwayanalysis_import`.
"""
function post_pathwayanalysis_import(
  body,
)

    url_stub = "pathway-analysis/import"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_evidence_drugconditionpairs(
  body,
  sourceKey::String,
)
```

Searches the evidence base for evidence related to one ore more drug and condition combinations for the source(s) specified

# Arguments

- `sourceKey::String` - The source key containing the CEM daimon

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_evidence_drugconditionpairs`.
"""
function post_evidence_drugconditionpairs(
  body,
  sourceKey::String,
)

    url_stub = "evidence/{sourceKey}/drugconditionpairs"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_estimation_generation(
  id::Number,
  sourceKey::String,
)
```

Generate an estimation design by ID on a specific sourceKey. Please note this requires configuration of the Arachne Execution Engine.

# Arguments

- `id::Number` - 

- `sourceKey::String` - The CDM source key

# Returns

- JobExecutionResource The job information

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_estimation_generation`.
"""
function post_estimation_generation(
  id::Number,
  sourceKey::String,
)

    url_stub = "estimation/{id}/generation/{sourceKey}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_reusable_bytags(
  body,
)
```

Get list of reusables with assigned tags

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_reusable_bytags`.
"""
function post_reusable_bytags(
  body,
)

    url_stub = "reusable/byTags"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_reusable(
  id::Number,
)
```



# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_reusable`.
"""
function post_reusable(
  id::Number,
)

    url_stub = "reusable/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_permission_access_role(
  body,
  entityType::Enum,
  entityId::Number,
  roleId::Number,
)
```

Grant group of permissions (READ / WRITE / ...) for the specified entity to the given role. Only owner of the entity can do that.

# Arguments

- `entityType::Enum` - The entity type

- `entityId::Number` - The entity ID

- `roleId::Number` - The role ID

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_permission_access_role`.
"""
function post_permission_access_role(
  body,
  entityType::Enum,
  entityId::Number,
  roleId::Number,
)

    url_stub = "permission/access/{entityType}/{entityId}/role/{roleId}"
    args = Dict(
        "entityType" => entityType,
        "entityId" => entityId,
        "roleId" => roleId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_evidence_negativecontrols(
  body,
  sourceKey::String,
)
```

Queues up a negative control generation task to compute negative controls using Common Evidence Model (CEM)

# Arguments

- `sourceKey::String` - The source key of the CEM daimon

# Returns

- information about the negative control job

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_evidence_negativecontrols`.
"""
function post_evidence_negativecontrols(
  body,
  sourceKey::String,
)

    url_stub = "evidence/{sourceKey}/negativecontrols"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_ir(
  body,
)
```

Creates the incidence rate analysis

# Returns

- The new FeasibilityStudy

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_ir`.
"""
function post_ir(
  body,
)

    url_stub = "ir/"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_ir_bytags(
  body,
)
```

Get list of incidence rates with assigned tags

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_ir_bytags`.
"""
function post_ir_bytags(
  body,
)

    url_stub = "ir/byTags"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortsample_refresh(
  query,
  cohortDefinitionId::Number,
  sourceKey::String,
  sampleId::Number,
)
```



# Arguments

- `cohortDefinitionId::Number` - 

- `sourceKey::String` - 

- `sampleId::Number` - 

# Returns

- A sample of persons from a cohort

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortsample_refresh`.
"""
function post_cohortsample_refresh(
  query,
  cohortDefinitionId::Number,
  sourceKey::String,
  sampleId::Number,
)

    url_stub = "cohortsample/{cohortDefinitionId}/{sourceKey}/{sampleId}/refresh"
    args = Dict(
        "cohortDefinitionId" => cohortDefinitionId,
        "sourceKey" => sourceKey,
        "sampleId" => sampleId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_ir_tag(
  body,
  id::Number,
)
```

Assign tag to IR Analysis

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_ir_tag`.
"""
function post_ir_tag(
  body,
  id::Number,
)

    url_stub = "ir/{id}/tag"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_cdmresults_conceptrecordcount(
  body,
  sourceKey::String,
)
```

Get the record count and descendant record count for one or more concepts in a single CDM database <p> This POST request accepts a json array containing one or more concept IDs. (e.g. [201826, 437827]) </p>

# Arguments

- `sourceKey::String` - The unique identifier for a CDM source (e.g. SYNPUF5PCT)

# Returns

- A javascript object with one element per concept. Each element is an array of lenth two containing the record count and descendent record count for the concept. <p> [ { "201826": [ 612861, 653173 ] }, { "437827": [ 224421, 224421 ] } ] </p> For concept id "201826" in the SYNPUF5PCT data source the record count is 612861 and the descendant record count is 653173.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cdmresults_conceptrecordcount`.
"""
function post_cdmresults_conceptrecordcount(
  body,
  sourceKey::String,
)

    url_stub = "cdmresults/{sourceKey}/conceptRecordCount"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_user_import_job(
  body,
)
```

Create a user import job

# Returns

- The job information

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_user_import_job`.
"""
function post_user_import_job(
  body,
)

    url_stub = "user/import/job/"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortdefinition_sql(
  body,
)
```

Returns OHDSI template SQL for a given cohort definition

# Returns

- The OHDSI template SQL needed to generate the input cohort definition as a character string

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortdefinition_sql`.
"""
function post_cohortdefinition_sql(
  body,
)

    url_stub = "cohortdefinition/sql"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_conceptset_protectedtag(
  body,
  id::Number,
)
```

Assign protected tag to Concept Set

# Arguments

- `id::Number` - The concept set ID

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_conceptset_protectedtag`.
"""
function post_conceptset_protectedtag(
  body,
  id::Number,
)

    url_stub = "conceptset/{id}/protectedtag"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_reusable_protectedtag(
  body,
  id::Number,
)
```

Assign protected tag to Reusable

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_reusable_protectedtag`.
"""
function post_reusable_protectedtag(
  body,
  id::Number,
)

    url_stub = "reusable/{id}/protectedtag"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_cohortdefinition_tag(
  body,
  id::Number,
)
```

Assign tag to Cohort Definition

# Arguments

- `id::Number` - the cohort definition id

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortdefinition_tag`.
"""
function post_cohortdefinition_tag(
  body,
  id::Number,
)

    url_stub = "cohortdefinition/{id}/tag"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_user_import(
  query,
  body,
)
```



> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_user_import`.
"""
function post_user_import(
  query,
  body,
)

    url_stub = "user/import"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortdefinition_checkv2(
  body,
)
```

Checks the cohort definition for logic issues This method runs a series of logical checks on a cohort definition and returns the set of warning, info and error messages. This method is similar to /check except this method accepts a ChortDTO which includes tags.

# Returns

- The cohort check result

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortdefinition_checkv2`.
"""
function post_cohortdefinition_checkv2(
  body,
)

    url_stub = "cohortdefinition/checkV2"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_pathwayanalysis_generation(
  id::Number,
  sourceKey::String,
)
```

Generate pathway analysis. This method will execute the analysis sql on the specified source.

# Arguments

- `id::Number` - 

- `sourceKey::String` - 

# Returns

- a job execution reference

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_pathwayanalysis_generation`.
"""
function post_pathwayanalysis_generation(
  id::Number,
  sourceKey::String,
)

    url_stub = "pathway-analysis/{id}/generation/{sourceKey}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_ir_protectedtag(
  body,
  id::Number,
)
```

Assign protected tag to IR Analysis

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_ir_protectedtag`.
"""
function post_ir_protectedtag(
  body,
  id::Number,
)

    url_stub = "ir/{id}/protectedtag"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_ir_sql(
  body,
)
```



> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_ir_sql`.
"""
function post_ir_sql(
  body,
)

    url_stub = "ir/sql"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortcharacterization_protectedtag(
  body,
  id::Number,
)
```

Assign protected tag to Cohort Characterization

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortcharacterization_protectedtag`.
"""
function post_cohortcharacterization_protectedtag(
  body,
  id::Number,
)

    url_stub = "cohort-characterization/{id}/protectedtag"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_cohortdefinition_printfriendly_conceptsets(
  query,
  body,
)
```

Render a list of concept sets in html or markdown form. This method calls out to the markdown renderer concept set expressions, and then converts to HTML if required. The response will contain the media type as TEXT_PLAIN or markdown, or TEXT_HTML for html. The body of the response is the print friendly content.

# Returns

- an HTTP response with the content, with the appropriate MediaType based on the format that was requested.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortdefinition_printfriendly_conceptsets`.
"""
function post_cohortdefinition_printfriendly_conceptsets(
  query,
  body,
)

    url_stub = "cohortdefinition/printfriendly/conceptsets"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_notifications_viewed(
  body,
)
```

Sets the date when notifications were last viewed

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_notifications_viewed`.
"""
function post_notifications_viewed(
  body,
)

    url_stub = "notifications/viewed"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_conceptset_check(
  body,
)
```

Checks a concept set for diagnostic problems. At this time, this appears to be an endpoint used to check to see which tags are applied to a concept set.

# Returns

- A check result

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_conceptset_check`.
"""
function post_conceptset_check(
  body,
)

    url_stub = "conceptset/check"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_pathwayanalysis_protectedtag(
  body,
  id::Number,
)
```

Assign protected tag to Pathway Analysis

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_pathwayanalysis_protectedtag`.
"""
function post_pathwayanalysis_protectedtag(
  body,
  id::Number,
)

    url_stub = "pathway-analysis/{id}/protectedtag"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_lookup_sourcecodes(
  body,
)
```

Get concepts from source codes from the default vocabulary source

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_lookup_sourcecodes`.
"""
function post_vocabulary_lookup_sourcecodes(
  body,
)

    url_stub = "vocabulary/lookup/sourcecodes"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_conceptset_bytags(
  body,
)
```

Get list of concept sets with their assigned tags

# Returns

- A list of concept sets with their assigned tags

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_conceptset_bytags`.
"""
function post_conceptset_bytags(
  body,
)

    url_stub = "conceptset/byTags"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortcharacterization_check(
  body,
)
```

Check that a cohort characterization definition is correct

# Returns

- A list of warnings that is possibly empty

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortcharacterization_check`.
"""
function post_cohortcharacterization_check(
  body,
)

    url_stub = "cohort-characterization/check"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_lookup_mapped(
  body,
)
```

Get concepts mapped to the selected concept identifiers from a specific source. Find all concepts mapped to the concept identifiers provided. This end-point will check the CONCEPT, CONCEPT_RELATIONSHIP and SOURCE_TO_CONCEPT_MAP tables.

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_lookup_mapped`.
"""
function post_vocabulary_lookup_mapped(
  body,
)

    url_stub = "vocabulary/lookup/mapped"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_prediction_generation(
  id::Number,
  sourceKey::String,
)
```

Generate a prediction design by ID on a specific sourceKey. Please note this requires configuration of the Arachne Execution Engine.

# Arguments

- `id::Number` - 

- `sourceKey::String` - The CDM source key

# Returns

- JobExecutionResource The job information

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_prediction_generation`.
"""
function post_prediction_generation(
  id::Number,
  sourceKey::String,
)

    url_stub = "prediction/{id}/generation/{sourceKey}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_cohortdefinition_protectedtag(
  body,
  id::Number,
)
```

Assign protected tag to Cohort Definition. This method passes through to assignTag(), but permissions to access this endpoint is determined by the path /{id}/protectedtag

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortdefinition_protectedtag`.
"""
function post_cohortdefinition_protectedtag(
  body,
  id::Number,
)

    url_stub = "cohortdefinition/{id}/protectedtag"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_estimation(
  body,
)
```

Used to add a new estimation design to the database

# Returns

- An EstimationDTO which contains the identifier assigned to the estimation design.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_estimation`.
"""
function post_estimation(
  body,
)

    url_stub = "estimation/"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_relatedconcepts(
  body,
)
```

Get the related concepts for a list of concept ids using the concept_relationship table

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_relatedconcepts`.
"""
function post_vocabulary_relatedconcepts(
  body,
)

    url_stub = "vocabulary/relatedconcepts"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_lookup_recommended(
  body,
  sourceKey::String,
)
```

Get the recommended concepts for a selected list of concept ids for a selected source key

# Arguments

- `sourceKey::String` - The source containing the vocabulary

# Returns

- A collection of recommended concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_lookup_recommended`.
"""
function post_vocabulary_lookup_recommended(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/lookup/recommended"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortdefinition_bytags(
  body,
)
```

Get list of cohort definitions with assigned tags. This method accepts a TagNameListRequestDTO that contains the list of tag names to find cohort definitions with.

# Returns

- the set of cohort definitions that match one of the included tag names.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortdefinition_bytags`.
"""
function post_cohortdefinition_bytags(
  body,
)

    url_stub = "cohortdefinition/byTags"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_sqlrender_translate(
  body,
)
```

Translate an OHDSI SQL to a supported target SQL dialect

# Returns

- rendered and translated SQL

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_sqlrender_translate`.
"""
function post_sqlrender_translate(
  body,
)

    url_stub = "sqlrender/translate"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortcharacterization_bytags(
  body,
)
```

Get list of cohort characterizations with assigned tags

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortcharacterization_bytags`.
"""
function post_cohortcharacterization_bytags(
  body,
)

    url_stub = "cohort-characterization/byTags"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortcharacterization(
  id::Number,
)
```

Create a copy of an existing cohort characterization

# Arguments

- `id::Number` - An existing cohort characterization id

# Returns

- The cohort characterization definition of the newly created copy

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortcharacterization`.
"""
function post_cohortcharacterization(
  id::Number,
)

    url_stub = "cohort-characterization/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_cohortsample(
  body,
  sourceKey::String,
  cohortDefinitionId::Number,
)
```

Create a new cohort sample

# Arguments

- `sourceKey::String` - 

- `cohortDefinitionId::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortsample`.
"""
function post_cohortsample(
  body,
  sourceKey::String,
  cohortDefinitionId::Number,
)

    url_stub = "cohortsample/{cohortDefinitionId}/{sourceKey}"
    args = Dict(
        "sourceKey" => sourceKey,
        "cohortDefinitionId" => cohortDefinitionId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortresults_warmup(
  body,
)
```

Provides a warmup mechanism for the data visualization cache. This endpoint does not appear to be used and may be a hold over from the original HERACLES implementation

# Returns

- The number of report visualizations warmed

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortresults_warmup`.
"""
function post_cohortresults_warmup(
  body,
)

    url_stub = "cohortresults/warmup"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_descendantofancestor(
  body,
  sourceKey::String,
)
```

Get the descendant concepts of the selected ancestor vocabulary and concept class for the selected sibling vocabulary and concept class. It is unclear how this endpoint is used so it may be a candidate to deprecate.

# Arguments

- `sourceKey::String` - The source containing the vocabulary

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_descendantofancestor`.
"""
function post_vocabulary_descendantofancestor(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/descendantofancestor"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohort_import(
  body,
)
```

Imports a List of CohortEntity into the COHORT table

# Returns

- status

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohort_import`.
"""
function post_cohort_import(
  body,
)

    url_stub = "cohort/import"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_prediction_import(
  body,
)
```

Import a full prediction design

# Returns

- The newly imported prediction

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_prediction_import`.
"""
function post_prediction_import(
  body,
)

    url_stub = "prediction/import"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortcharacterization_generation_result_export(
  body,
  generationId::Number,
)
```



# Arguments

- `generationId::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortcharacterization_generation_result_export`.
"""
function post_cohortcharacterization_generation_result_export(
  body,
  generationId::Number,
)

    url_stub = "cohort-characterization/generation/{generationId}/result/export"
    args = Dict(
        "generationId" => generationId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_conceptsetexpressionsql(
  body,
)
```

Produces a SQL query to use against your OMOP CDM to create the resolved concept set

# Returns

- SQL Statement as text

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_conceptsetexpressionsql`.
"""
function post_vocabulary_conceptsetexpressionsql(
  body,
)

    url_stub = "vocabulary/conceptSetExpressionSQL"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_conceptlist_descendants(
  body,
)
```

Get the descendant concepts for a selected list of concept ids

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_conceptlist_descendants`.
"""
function post_vocabulary_conceptlist_descendants(
  body,
)

    url_stub = "vocabulary/conceptlist/descendants"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_user_import(
  body,
  type::String,
)
```



# Arguments

- `type::String` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_user_import`.
"""
function post_user_import(
  body,
  type::String,
)

    url_stub = "user/import/{type}"
    args = Dict(
        "type" => type,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortcharacterization_generation(
  id::Number,
  sourceKey::String,
)
```

Generate a cohort characterization on a single data source

# Arguments

- `id::Number` - The id of an existing cohort characterization in WebAPI

- `sourceKey::String` - The identifier for the data source to generate against

# Returns

- A json object with information about the generation job included the status and execution id.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortcharacterization_generation`.
"""
function post_cohortcharacterization_generation(
  id::Number,
  sourceKey::String,
)

    url_stub = "cohort-characterization/{id}/generation/{sourceKey}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_role(
  body,
)
```



> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_role`.
"""
function post_role(
  body,
)

    url_stub = "role"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_pathwayanalysis_tag(
  body,
  id::Number,
)
```

Assign tag to Pathway Analysis

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_pathwayanalysis_tag`.
"""
function post_pathwayanalysis_tag(
  body,
  id::Number,
)

    url_stub = "pathway-analysis/{id}/tag"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_includedconcepts_count(
  body,
  sourceKey::String,
)
```

Resolve a concept set expression to get the count of included concepts using the selected vocabulary source.

# Arguments

- `sourceKey::String` - The source containing the vocabulary

# Returns

- A count of included concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_includedconcepts_count`.
"""
function post_vocabulary_includedconcepts_count(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/included-concepts/count"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_commonancestors(
  body,
  sourceKey::String,
)
```

Get a list of common ancestor concepts for a selected list of concept identifiers using the selected vocabulary source.

# Arguments

- `sourceKey::String` - The source containing the vocabulary

# Returns

- A collection of related concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_commonancestors`.
"""
function post_vocabulary_commonancestors(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/commonAncestors"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_conceptset_tag(
  body,
  id::Number,
)
```

Assign tag to Concept Set

# Arguments

- `id::Number` - The concept set ID

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_conceptset_tag`.
"""
function post_conceptset_tag(
  body,
  id::Number,
)

    url_stub = "conceptset/{id}/tag"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_executionservice_callbacks_submission_status_update(
  body,
  id::Number,
  password::String,
)
```

Update an execution submission

# Arguments

- `id::Number` - The execution ID

- `password::String` - The password

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_executionservice_callbacks_submission_status_update`.
"""
function post_executionservice_callbacks_submission_status_update(
  body,
  id::Number,
  password::String,
)

    url_stub = "executionservice/callbacks/submission/{id}/status/update/{password}"
    args = Dict(
        "id" => id,
        "password" => password,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_descendantofancestor(
  body,
)
```

Get the descendant concepts of the selected ancestor vocabulary and concept class for the selected sibling vocabulary and concept class. It is unclear how this endpoint is used so it may be a candidate to deprecate.

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_descendantofancestor`.
"""
function post_vocabulary_descendantofancestor(
  body,
)

    url_stub = "vocabulary/descendantofancestor"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_commonancestors(
  body,
)
```

Get a list of common ancestor concepts for a selected list of concept identifiers using the default vocabulary source.

# Returns

- A collection of related concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_commonancestors`.
"""
function post_vocabulary_commonancestors(
  body,
)

    url_stub = "vocabulary/commonAncestors"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_tag_multiunassign(
  body,
)
```

Unassignes group of tags from groups of assets.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_tag_multiunassign`.
"""
function post_tag_multiunassign(
  body,
)

    url_stub = "tag/multiUnassign"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_pathwayanalysis_check(
  body,
)
```

Checks the pathway analysis for logic issues This method runs a series of logical checks on a pathway analysis and returns the set of warning, info and error messages.

# Returns

- the set of checks (warnings, info and errors)

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_pathwayanalysis_check`.
"""
function post_pathwayanalysis_check(
  body,
)

    url_stub = "pathway-analysis/check"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_compare(
  body,
)
```

Compares two concept set expressions to find which concepts are shared or unique to each concept set.

# Returns

- A collection of concept set comparisons

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_compare`.
"""
function post_vocabulary_compare(
  body,
)

    url_stub = "vocabulary/compare"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_estimation_check(
  body,
)
```

Performs a series of checks of the estimation design to ensure it will properly execute.

# Returns

- CheckResult The results of performing all checks

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_estimation_check`.
"""
function post_estimation_check(
  body,
)

    url_stub = "estimation/check"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_lookup_sourcecodes(
  body,
  sourceKey::String,
)
```

Get concepts from source codes from a specific source

# Arguments

- `sourceKey::String` - path parameter specifying the source key identifying the source to use for access to the set of vocabulary tables

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_lookup_sourcecodes`.
"""
function post_vocabulary_lookup_sourcecodes(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/lookup/sourcecodes"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortcharacterization(
  body,
)
```

Create a new cohort characterization

# Returns

- The cohort characterization definition passed in as input with additional fields (createdDate, hasWriteAccess, tags, id, hashcode).

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortcharacterization`.
"""
function post_cohortcharacterization(
  body,
)

    url_stub = "cohort-characterization/"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_conceptset(
  body,
)
```

Save a new concept set to the WebAPI database

# Returns

- The concept set saved with the concept set identifier

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_conceptset`.
"""
function post_conceptset(
  body,
)

    url_stub = "conceptset/"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_prediction_check(
  body,
)
```

Performs a series of checks of the prediction design to ensure it will properly execute.

# Returns

- CheckResult The results of performing all checks

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_prediction_check`.
"""
function post_prediction_check(
  body,
)

    url_stub = "prediction/check"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_conceptlist_descendants(
  body,
  sourceKey::String,
)
```

Get the descendant concepts for a selected list of concept ids for a selected source key

# Arguments

- `sourceKey::String` - The source containing the vocabulary

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_conceptlist_descendants`.
"""
function post_vocabulary_conceptlist_descendants(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/conceptlist/descendants"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_relatedconcepts(
  body,
  sourceKey::String,
)
```

Get the related concepts for a list of concept ids using the concept_relationship table for the selected source key

# Arguments

- `sourceKey::String` - The source containing the vocabulary

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_relatedconcepts`.
"""
function post_vocabulary_relatedconcepts(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/relatedconcepts"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_executionservice_callbacks_submission_result(
  body,
  id::Number,
  password::String,
)
```

Update the execution multipart information

# Arguments

- `id::Number` - The execution ID

- `password::String` - The password

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_executionservice_callbacks_submission_result`.
"""
function post_executionservice_callbacks_submission_result(
  body,
  id::Number,
  password::String,
)

    url_stub = "executionservice/callbacks/submission/{id}/result/{password}"
    args = Dict(
        "id" => id,
        "password" => password,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "multipart/form-data"); 
        body = body
    )
    

end

"""
```julia
post_cohortcharacterization_import(
  body,
)
```

Add a new cohort characterization analysis to WebAPI

# Returns

- The same cohort characterization definition that was passed as input

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortcharacterization_import`.
"""
function post_cohortcharacterization_import(
  body,
)

    url_stub = "cohort-characterization/import"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_tag(
  body,
)
```

Creates a tag.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_tag`.
"""
function post_tag(
  body,
)

    url_stub = "tag/"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_prediction(
  body,
)
```

Used to add a new prediction design to the database

# Returns

- An PredictionAnalysisDTO which contains the identifier assigned to the prediction design.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_prediction`.
"""
function post_prediction(
  body,
)

    url_stub = "prediction/"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_pathwayanalysis(
  body,
)
```

Create a new pathway analysis design. A pathway analysis consists of a set of target cohorts, event cohorts, and analysis settings for collapsing and repeat events. By default, the new design will have the createdBy set to the authenticated user, and the createdDate to the current time.

# Returns

- the created pathway analysis

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_pathwayanalysis`.
"""
function post_pathwayanalysis(
  body,
)

    url_stub = "pathway-analysis/"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_resolveconceptsetexpression(
  body,
)
```

Resolve a concept set expression into a collection of concept identifiers using the default vocabulary source.

# Returns

- A collection of concept identifiers

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_resolveconceptsetexpression`.
"""
function post_vocabulary_resolveconceptsetexpression(
  body,
)

    url_stub = "vocabulary/resolveConceptSetExpression"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_tag_multiassign(
  body,
)
```

Assignes group of tags to groups of assets.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_tag_multiassign`.
"""
function post_tag_multiassign(
  body,
)

    url_stub = "tag/multiAssign"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_reusable_tag(
  body,
  id::Number,
)
```

Assign tag to Reusable

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_reusable_tag`.
"""
function post_reusable_tag(
  body,
  id::Number,
)

    url_stub = "reusable/{id}/tag"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end

"""
```julia
post_cohortcharacterization_generation_result(
  body,
  generationId::Number,
)
```



# Arguments

- `generationId::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortcharacterization_generation_result`.
"""
function post_cohortcharacterization_generation_result(
  body,
  generationId::Number,
)

    url_stub = "cohort-characterization/generation/{generationId}/result"
    args = Dict(
        "generationId" => generationId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_search(
  body,
)
```

Search for a concept on the default vocabulary source.

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_search`.
"""
function post_vocabulary_search(
  body,
)

    url_stub = "vocabulary/search"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_reusable(
  body,
)
```



> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_reusable`.
"""
function post_reusable(
  body,
)

    url_stub = "reusable/"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortdefinition_check(
  body,
)
```

Checks the cohort definition for logic issues This method runs a series of logical checks on a cohort definition and returns the set of warning, info and error messages.

# Returns

- The cohort check result

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortdefinition_check`.
"""
function post_cohortdefinition_check(
  body,
)

    url_stub = "cohortdefinition/check"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_ir_check(
  body,
)
```



> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_ir_check`.
"""
function post_ir_check(
  body,
)

    url_stub = "ir/check"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_optimize(
  body,
)
```

Optimizes a concept set expressions to find redundant concepts specified in a concept set expression.

# Returns

- A concept set optimization

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_optimize`.
"""
function post_vocabulary_optimize(
  body,
)

    url_stub = "vocabulary/optimize"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_source(
  body,
)
```

Create a Source

# Returns

- a new SourceInfo for the created source

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_source`.
"""
function post_source(
  body,
)

    url_stub = "source/"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "multipart/form-data"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_optimize(
  body,
  sourceKey::String,
)
```

Optimizes a concept set expressions to find redundant concepts specified in a concept set expression for the selected source key.

# Arguments

- `sourceKey::String` - The source containing the vocabulary

# Returns

- A concept set optimization

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_optimize`.
"""
function post_vocabulary_optimize(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/optimize"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortdefinition(
  body,
)
```

Creates a cohort definition in the WebAPI database. The values for createdBy and createdDate are automatically populated and the function ignores parameter values for these fields.

# Returns

- The newly created cohort definition

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortdefinition`.
"""
function post_cohortdefinition(
  body,
)

    url_stub = "cohortdefinition/"
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_evidence_labelevidence(
  body,
  sourceKey::String,
)
```

Originally provided a label evidence search from LAERTES

# Arguments

- `sourceKey::String` - The source key of the CEM daimon

# Returns

- A list of evidence

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_evidence_labelevidence`.
"""
function post_evidence_labelevidence(
  body,
  sourceKey::String,
)

    url_stub = "evidence/{sourceKey}/labelevidence"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_vocabulary_search(
  body,
  sourceKey::String,
)
```

Search for a concept on the selected source.

# Arguments

- `sourceKey::String` - The source key for the concept search

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_vocabulary_search`.
"""
function post_vocabulary_search(
  body,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/search"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => "application/json"); 
        body = body
    )
    

end

"""
```julia
post_cohortcharacterization_tag(
  body,
  id::Number,
)
```

Assign tag to Cohort Characterization

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?post_cohortcharacterization_tag`.
"""
function post_cohortcharacterization_tag(
  body,
  id::Number,
)

    url_stub = "cohort-characterization/{id}/tag"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    res = HTTP.post(
        joinpath(BASE_URL, url_stub), 
        Dict("Content-Type" => ""); 
        body = body
    )
    

end


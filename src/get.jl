"""
```julia
get_pathwayanalysis_sql(
  id::Number,
  sourceKey::String,
)
```

Generate pathway analysis sql This method generates the analysis sql for the given design id and specified source. This means that the pathway design must be saved to the database, and a valid source key is provided as the sourceKey parameter. The result is a fully translated and populated query containing the schema parameters and translation based on the specified source.

# Arguments

- `id::Number` - the pathway analysis design id

- `sourceKey::String` - the source used to find the schema and dialect

# Returns

- a String containing the analysis sql

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_pathwayanalysis_sql`.
"""
function get_pathwayanalysis_sql(
  id::Number,
  sourceKey::String,
)

    url_stub = "pathway-analysis/{id}/sql/{sourceKey}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_featureanalysis_export_conceptset(
  id::Number,
)
```



# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_featureanalysis_export_conceptset`.
"""
function get_featureanalysis_export_conceptset(
  id::Number,
)

    url_stub = "feature-analysis/{id}/export/conceptset"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_pathwayanalysis_version(
  id::Number,
  version::Number,
)
```

Get specific version of Pathway Analysis

# Arguments

- `id::Number` - 

- `version::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_pathwayanalysis_version`.
"""
function get_pathwayanalysis_version(
  id::Number,
  version::Number,
)

    url_stub = "pathway-analysis/{id}/version/{version}"
    args = Dict(
        "id" => id,
        "version" => version,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_user_import_job(
)
```

Get the user import job list

# Returns

- The list of user import jobs

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_user_import_job`.
"""
function get_user_import_job(
)

    url_stub = "user/import/job/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_heraclesheel(
  query,
  id::Number,
  sourceKey::String,
)
```

Returns heracles heel results (data quality issues) for the given cohort definition id

# Arguments

- `id::Number` - The cohort iD

- `sourceKey::String` - The source key

# Returns

- List<CohortAttribute>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_heraclesheel`.
"""
function get_cohortresults_heraclesheel(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/heraclesheel"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_breakdown(
  id::Number,
  sourceKey::String,
  gender::String,
  age::String,
  conditions::String,
  drugs::String,
  rows::Number,
)
```

Returns the person identifiers of all members of a cohort breakdown from above

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

- `gender::String` - The string for gender (male/female)

- `age::String` - The numeric age

- `conditions::String` - The condition concept IDs

- `drugs::String` - The drug concept ids

- `rows::Number` - The row limit

# Returns

- List of all members of a generated cohort definition identifier

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_breakdown`.
"""
function get_cohortresults_breakdown(
  id::Number,
  sourceKey::String,
  gender::String,
  age::String,
  conditions::String,
  drugs::String,
  rows::Number,
)

    url_stub = "cohortresults/{sourceKey}/{id}/breakdown/{gender}/{age}/{conditions}/{drugs}/{rows}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
        "gender" => gender,
        "age" => age,
        "conditions" => conditions,
        "drugs" => drugs,
        "rows" => rows,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_user_roles(
  userId::Number,
)
```



# Arguments

- `userId::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_user_roles`.
"""
function get_user_roles(
  userId::Number,
)

    url_stub = "user/{userId}/roles"
    args = Dict(
        "userId" => userId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization_exists(
  query,
  id::Number,
)
```

Check if a cohort characterization with the same name exists <p>This endpoint is used to check that a desired name for a characterization does not already exist in WebAPI</p>

# Arguments

- `id::Number` - The id for a new characterization that does not currently exist in WebAPI

# Returns

- The number of existing characterizations with the same name that was passed as a query parameter

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization_exists`.
"""
function get_cohortcharacterization_exists(
  query,
  id::Number,
)

    url_stub = "cohort-characterization/{id}/exists"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_negativecontrols(
  sourceKey::String,
  conceptsetid::Number,
)
```

Retrieves the negative controls for a concept set

# Arguments

- `sourceKey::String` - The source key of the CEM daimon

- `conceptsetid::Number` - The concept set id

# Returns

- The list of negative controls

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_negativecontrols`.
"""
function get_evidence_negativecontrols(
  sourceKey::String,
  conceptsetid::Number,
)

    url_stub = "evidence/{sourceKey}/negativecontrols/{conceptsetid}"
    args = Dict(
        "sourceKey" => sourceKey,
        "conceptsetid" => conceptsetid,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_drug(
  query,
  id::Number,
  drugId::Number,
  sourceKey::String,
)
```

Queries for cohort analysis drug drilldown results for the given cohort definition id and drug id

# Arguments

- `id::Number` - The cohort ID

- `drugId::Number` - The drug concept ID

- `sourceKey::String` - The source key

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_drug`.
"""
function get_cohortresults_drug(
  query,
  id::Number,
  drugId::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/drug/{drugId}"
    args = Dict(
        "id" => id,
        "drugId" => drugId,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ir_info(
  id::Number,
  sourceKey::String,
)
```



# Arguments

- `id::Number` - 

- `sourceKey::String` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ir_info`.
"""
function get_ir_info(
  id::Number,
  sourceKey::String,
)

    url_stub = "ir/{id}/info/{sourceKey}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_reusable_version(
  id::Number,
)
```

Get list of versions of Reusable

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_reusable_version`.
"""
function get_reusable_version(
  id::Number,
)

    url_stub = "reusable/{id}/version"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ir_copy(
  id::Number,
)
```

Copies the specified cohort definition

# Arguments

- `id::Number` - - the Cohort Definition ID to copy

# Returns

- the copied cohort definition as a CohortDefinitionDTO

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ir_copy`.
"""
function get_ir_copy(
  id::Number,
)

    url_stub = "ir/{id}/copy"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ir_design(
  id::Number,
)
```



# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ir_design`.
"""
function get_ir_design(
  id::Number,
)

    url_stub = "ir/{id}/design"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortsample_hassamples(
  sourceKey::String,
  cohortDefinitionId::Number,
)
```

Does an existing cohort have samples from a particular source?

# Arguments

- `sourceKey::String` - 

- `cohortDefinitionId::Number` - 

# Returns

- true or false

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortsample_hassamples`.
"""
function get_cohortsample_hassamples(
  sourceKey::String,
  cohortDefinitionId::Number,
)

    url_stub = "cohortsample/has-samples/{cohortDefinitionId}/{sourceKey}"
    args = Dict(
        "sourceKey" => sourceKey,
        "cohortDefinitionId" => cohortDefinitionId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortdefinition_copy(
  id::Number,
)
```

Copies the specified cohort definition. This method takes a cohort definition id, and creates a copy. This copy has no tags and the owner is set to the user who made the copy.

# Arguments

- `id::Number` - - the Cohort Definition ID to copy

# Returns

- the copied cohort definition as a CohortDTO

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortdefinition_copy`.
"""
function get_cohortdefinition_copy(
  id::Number,
)

    url_stub = "cohortdefinition/{id}/copy"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_pathwayanalysis_generation_design(
  generationId::Number,
)
```

Get the pathway analysis design for the given generation id When a pathway analysis is generated, a snapshot of the design is stored, and indexed by the hash of the design. This method allows you to fetch the pathway design given a generation id.

# Arguments

- `generationId::Number` - the generation to fetch the design for

# Returns

- a JSON representation of the pathway analysis design.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_pathwayanalysis_generation_design`.
"""
function get_pathwayanalysis_generation_design(
  generationId::Number,
)

    url_stub = "pathway-analysis/generation/{generationId}/design"
    args = Dict(
        "generationId" => generationId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cdmresults_datadensity(
  sourceKey::String,
)
```

Queries for data density report for the given sourceKey

# Arguments

- `sourceKey::String` - The source key

# Returns

- CDMDataDensity

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cdmresults_datadensity`.
"""
function get_cdmresults_datadensity(
  sourceKey::String,
)

    url_stub = "cdmresults/{sourceKey}/datadensity"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_concept_related(
  sourceKey::String,
  id::Number,
)
```

Get related concepts for the selected concept identifier from a source. Related concepts will include those concepts that have a relationship to the selected concept identifier in the CONCEPT_RELATIONSHIP and CONCEPT_ANCESTOR tables.

# Arguments

- `sourceKey::String` - The source containing the vocabulary

- `id::Number` - The concept ID to find

# Returns

- A collection of related concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_concept_related`.
"""
function get_vocabulary_concept_related(
  sourceKey::String,
  id::Number,
)

    url_stub = "vocabulary/{sourceKey}/concept/{id}/related"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_job(
)
```

Get job names (unique names). Note: this path (GET /job) should really return pages of job instances. This could be implemented should the need arise. See <code>JobService#list(String, Integer, Integer)</code> to obtain executions and filter by job name.

# Returns

- A list of jobs

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_job`.
"""
function get_job(
)

    url_stub = "job/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ir_version(
  id::Number,
  version::Number,
)
```

Get version of IR Analysis

# Arguments

- `id::Number` - 

- `version::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ir_version`.
"""
function get_ir_version(
  id::Number,
  version::Number,
)

    url_stub = "ir/{id}/version/{version}"
    args = Dict(
        "id" => id,
        "version" => version,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_hoi(
  sourceKey::String,
  id::Number,
)
```

Retrieves a list of evidence for the specified health outcome of interest (hoi) conceptId

# Arguments

- `sourceKey::String` - The source key containing the CEM daimon

- `id::Number` - The conceptId for the health outcome of interest

# Returns

- A list of evidence

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_hoi`.
"""
function get_evidence_hoi(
  sourceKey::String,
  id::Number,
)

    url_stub = "evidence/{sourceKey}/hoi/{id}"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_permission_access(
  entityType::Enum,
  entityId::Number,
)
```

Get entity role access information

# Arguments

- `entityType::Enum` - The entity type

- `entityId::Number` - The entity ID

# Returns

- The list of roles

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_permission_access`.
"""
function get_permission_access(
  entityType::Enum,
  entityId::Number,
)

    url_stub = "permission/access/{entityType}/{entityId}"
    args = Dict(
        "entityType" => entityType,
        "entityId" => entityId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_prediction_copy(
  id::Number,
)
```

Used to create a copy of an existing existing prediction design by ID.

# Arguments

- `id::Number` - The ID of the prediction design

# Returns

- An PredictionAnalysisDTO which contains the newly copied prediction design.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_prediction_copy`.
"""
function get_prediction_copy(
  id::Number,
)

    url_stub = "prediction/{id}/copy"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_cohortspecific(
  query,
  id::Number,
  sourceKey::String,
)
```

Queries for cohort analysis cohort specific results for the given cohort definition id

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- CohortSpecificSummary

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_cohortspecific`.
"""
function get_cohortresults_cohortspecific(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/cohortspecific"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization_generation(
  id::Number,
)
```

Get all generations for a cohort characterization

# Arguments

- `id::Number` - The id for an existing cohort characterization

# Returns

- An array of all generations that includes the generation id, sourceKey, start and end times

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization_generation`.
"""
function get_cohortcharacterization_generation(
  id::Number,
)

    url_stub = "cohort-characterization/{id}/generation"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_distinctpersoncount(
  query,
  sourceKey::String,
  id::String,
)
```

Get the distinct person count for a cohort

# Arguments

- `sourceKey::String` - The source key

- `id::String` - The cohort ID

# Returns

- Distinct person count as integer

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_distinctpersoncount`.
"""
function get_cohortresults_distinctpersoncount(
  query,
  sourceKey::String,
  id::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/distinctPersonCount"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset_copyname(
  id::Number,
)
```

Creates a concept set name, based on the selected concept set ID, that is used when generating a copy of an existing concept set. This function is generally used in conjunction with the copy endpoint to create a unique name and then save a copy of an existing concept set.

# Arguments

- `id::Number` - The concept set ID

# Returns

- A map of the new concept set name and the existing concept set name

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset_copyname`.
"""
function get_conceptset_copyname(
  id::Number,
)

    url_stub = "conceptset/{id}/copy-name"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_permission(
)
```

Get the list of permissions for a user

# Returns

- A list of permissions

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_permission`.
"""
function get_permission(
)

    url_stub = "permission/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_label(
  setid::String,
)
```

<a href="https://github.com/OHDSI/Penelope">PENELOPE</a> function: reference to the list of product labels in the WebAPI DRUG_LABELS table that associates a product label SET_ID to the RxNorm ingredient. This will be depreciated in a future release as this can be found using the OMOP vocabulary

# Arguments

- `setid::String` - The drug label setId

# Returns

- The set of drug labels that match the setId specified.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_label`.
"""
function get_evidence_label(
  setid::String,
)

    url_stub = "evidence/label/{setid}"
    args = Dict(
        "setid" => setid,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization_design(
  body,
)
```

Get the design specification for every cohort-characterization analysis in WebAPI.

# Returns

- A json object with all characterization design specifications.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization_design`.
"""
function get_cohortcharacterization_design(
  body,
)

    url_stub = "cohort-characterization/design"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_prediction_download(
  query,
  id::Number,
)
```

Download an R package to execute the prediction study

# Arguments

- `id::Number` - The id for the prediction study

# Returns

- Binary_zip file containing the full R package

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_prediction_download`.
"""
function get_prediction_download(
  query,
  id::Number,
)

    url_stub = "prediction/{id}/download"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_job_execution(
  executionId::Number,
)
```

Find job execution by execution ID

# Arguments

- `executionId::Number` - The job execution ID

# Returns

- JobExecutionResource

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_job_execution`.
"""
function get_job_execution(
  executionId::Number,
)

    url_stub = "job/execution/{executionId}"
    args = Dict(
        "executionId" => executionId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ir(
)
```

Returns all IR Analysis in a list.

# Returns

- List of IncidenceRateAnalysis

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ir`.
"""
function get_ir(
)

    url_stub = "ir/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_members_count(
  id::Number,
  sourceKey::String,
)
```

Returns the count of all members of a generated cohort definition identifier

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- The cohort count

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_members_count`.
"""
function get_cohortresults_members_count(
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/members/count"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization_generation_design(
  generationId::Number,
)
```

Get the definition of a cohort characterization for a given generation id

# Arguments

- `generationId::Number` - 

# Returns

- A cohort characterization definition

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization_generation_design`.
"""
function get_cohortcharacterization_generation_design(
  generationId::Number,
)

    url_stub = "cohort-characterization/generation/{generationId}/design"
    args = Dict(
        "generationId" => generationId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_completed(
  id::Number,
  sourceKey::String,
)
```

Provides a list of cohort analysis visualizations that are completed

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- A list of visualization keys that are complete

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_completed`.
"""
function get_cohortresults_completed(
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/completed"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_user_import_mapping(
  type::String,
)
```



# Arguments

- `type::String` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_user_import_mapping`.
"""
function get_user_import_mapping(
  type::String,
)

    url_stub = "user/import/{type}/mapping"
    args = Dict(
        "type" => type,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_cohortspecifictreemap(
  query,
  id::Number,
  sourceKey::String,
)
```

Queries for cohort analysis cohort specific treemap results for the given cohort definition id

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- CohortSpecificTreemap

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_cohortspecifictreemap`.
"""
function get_cohortresults_cohortspecifictreemap(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/cohortspecifictreemap"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_domains(
  sourceKey::String,
)
```

Get a collection of domains from the domain table in the vocabulary for the the selected source key.

# Arguments

- `sourceKey::String` - The source containing the vocabulary

# Returns

- A collection of domains

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_domains`.
"""
function get_vocabulary_domains(
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/domains"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_i18n(
)
```



> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_i18n`.
"""
function get_i18n(
)

    url_stub = "i18n/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_condition(
  query,
  sourceKey::String,
  id::Number,
)
```

Queries for cohort analysis condition treemap results for the given cohort definition id

# Arguments

- `sourceKey::String` - The source key

- `id::Number` - The cohort ID

# Returns

- List<HierarchicalConceptRecord>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_condition`.
"""
function get_cohortresults_condition(
  query,
  sourceKey::String,
  id::Number,
)

    url_stub = "cohortresults/{sourceKey}/{id}/condition"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_drug(
  query,
  id::Number,
  sourceKey::String,
)
```

Queries for drug analysis treemap results for the given cohort definition id

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- List<HierarchicalConceptRecord>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_drug`.
"""
function get_cohortresults_drug(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/drug"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_cohortspecificcondition(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)
```

Queries for cohort analysis condition drilldown results for the given cohort definition id and concept id

# Arguments

- `id::Number` - The cohort ID

- `conceptId::Number` - The condition concept ID

- `sourceKey::String` - The source key

# Returns

- List<ScatterplotRecord>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_cohortspecificcondition`.
"""
function get_cohortresults_cohortspecificcondition(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/cohortspecificcondition/{conceptId}"
    args = Dict(
        "id" => id,
        "conceptId" => conceptId,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_info(
  sourceKey::String,
)
```

Provides a high level description of the information found in the Common Evidence Model (CEM).

# Arguments

- `sourceKey::String` - The source key containing the CEM daimon

# Returns

- A collection of evidence information stored in CEM

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_info`.
"""
function get_evidence_info(
  sourceKey::String,
)

    url_stub = "evidence/{sourceKey}/info"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ir_export(
  id::Number,
)
```

Exports the analysis definition and results

# Arguments

- `id::Number` - - the IR Analysis ID to export

# Returns

- Response containing binary stream of_zipped data

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ir_export`.
"""
function get_ir_export(
  id::Number,
)

    url_stub = "ir/{id}/export"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_job_type_name(
  jobName::String,
  jobType::String,
)
```

Get the job execution information by job type and name

# Arguments

- `jobName::String` - The job name

- `jobType::String` - The job type

# Returns

- JobExecutionResource

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_job_type_name`.
"""
function get_job_type_name(
  jobName::String,
  jobType::String,
)

    url_stub = "job/type/{jobType}/name/{jobName}"
    args = Dict(
        "jobName" => jobName,
        "jobType" => jobType,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization(
  body,
)
```

Get information about the cohort characterization analyses in WebAPI

# Returns

- A json object with information about the characterization analyses in WebAPI.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization`.
"""
function get_cohortcharacterization(
  body,
)

    url_stub = "cohort-characterization/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_info(
  sourceKey::String,
  id::Number,
)
```

Get the analysis generation progress

# Arguments

- `sourceKey::String` - The source key

- `id::Number` - The cohort ID

# Returns

- The generation progress information

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_info`.
"""
function get_cohortresults_info(
  sourceKey::String,
  id::Number,
)

    url_stub = "cohortresults/{sourceKey}/{id}/info"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_source_sources(
)
```

Gets the list of all Sources in WebAPI database. Sources with a non-null deleted_date are not returned (ie: these are soft deleted)

# Returns

- A list of all CDM sources with the ID, name, SQL dialect, and key for each source. The {sourceKey} is used in other WebAPI endpoints to identify CDMs.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_source_sources`.
"""
function get_source_sources(
)

    url_stub = "source/sources"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_negativecontrols_sql(
  query,
  sourceKey::String,
)
```

Retrieves parameterized SQL used to generate negative controls

# Arguments

- `sourceKey::String` - The source key of the CEM daimon

# Returns

- The list of negative controls

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_negativecontrols_sql`.
"""
function get_evidence_negativecontrols_sql(
  query,
  sourceKey::String,
)

    url_stub = "evidence/{sourceKey}/negativecontrols/sql"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortdefinition_cancel(
  id::Number,
  sourceKey::String,
)
```

Cancel a cohort generation task This method updates the generation info to 'Canceled' and invalidates the job execution on the server. Note: invalidating the job is performed by indicating that the job execution should stop at the next SQL step in the analysis query. This means that the execution will not physically cancel until the current step in the SQL query completes.

# Arguments

- `id::Number` - the id of the cohort definition being generated

- `sourceKey::String` - the sourceKey for the target database for generation

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortdefinition_cancel`.
"""
function get_cohortdefinition_cancel(
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortdefinition/{id}/cancel/{sourceKey}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_info(
  sourceKey::String,
)
```

Get the vocabulary version from the vocabulary table using the selected source key

# Arguments

- `sourceKey::String` - The source containing the vocabulary

# Returns

- The vocabulary info

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_info`.
"""
function get_vocabulary_info(
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/info"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_i18n_locales(
)
```



> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_i18n_locales`.
"""
function get_i18n_locales(
)

    url_stub = "i18n/locales"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_datadensity(
  query,
  id::Number,
  sourceKey::String,
)
```

Queries for cohort analysis data density for the given cohort definition id

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- CohortDataDensity

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_datadensity`.
"""
function get_cohortresults_datadensity(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/datadensity"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_user_me(
)
```



> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_user_me`.
"""
function get_user_me(
)

    url_stub = "user/me"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization_download(
  query,
  id::Number,
)
```

Download a cohort characterization R study package that can be used to run the characterization on an OMOP CDM from R

# Arguments

- `id::Number` - id of the cohort characterization to convert to an R study package

# Returns

- A_zip file containing the cohort characterization R study package

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization_download`.
"""
function get_cohortcharacterization_download(
  query,
  id::Number,
)

    url_stub = "cohort-characterization/{id}/download"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_concept_related(
  id::Number,
)
```

Get related concepts for the selected concept identifier from the default vocabulary source.

# Arguments

- `id::Number` - The concept identifier

# Returns

- A collection of related concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_concept_related`.
"""
function get_vocabulary_concept_related(
  id::Number,
)

    url_stub = "vocabulary/concept/{id}/related"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization(
  id::Number,
)
```

Get metadata about a cohort characterization.

# Arguments

- `id::Number` - The id for an existing cohort characterization

# Returns

- name, createdDate, tags, etc for a single cohort characterization.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization`.
"""
function get_cohortcharacterization(
  id::Number,
)

    url_stub = "cohort-characterization/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_conditionera(
  query,
  sourceKey::String,
  id::Number,
)
```

Queries for cohort analysis condition era treemap results for the given cohort definition id

# Arguments

- `sourceKey::String` - The source key

- `id::Number` - The cohort ID

# Returns

- List<HierarchicalConceptRecord>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_conditionera`.
"""
function get_cohortresults_conditionera(
  query,
  sourceKey::String,
  id::Number,
)

    url_stub = "cohortresults/{sourceKey}/{id}/conditionera"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_allentropy(
  id::Number,
  sourceKey::String,
)
```

Provide a full entropy report for a cohort

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- List<EntropyAttr>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_allentropy`.
"""
function get_cohortresults_allentropy(
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/allentropy"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_notifications(
  query,
)
```

Get the list of notifications

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_notifications`.
"""
function get_notifications(
  query,
)

    url_stub = "notifications/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_featureanalysis(
  id::Number,
)
```

Get data about a specific feature analysis

# Arguments

- `id::Number` - ID of feature analysis to retrieve

# Returns

- ID, type, name domain, description, etc of feature analysis

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_featureanalysis`.
"""
function get_featureanalysis(
  id::Number,
)

    url_stub = "feature-analysis/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_featureanalysis_copy(
  id::Number,
)
```

Create a copy of a feature analysis

# Arguments

- `id::Number` - ID of feature analysis to copy

# Returns

- The design specification of the new copy

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_featureanalysis_copy`.
"""
function get_featureanalysis_copy(
  id::Number,
)

    url_stub = "feature-analysis/{id}/copy"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_estimation_generation(
  id::Number,
)
```

Get a list of generations for the selected estimation design.

# Arguments

- `id::Number` - 

# Returns

- List<ExecutionBasedGenerationDTO> The list of generations

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_estimation_generation`.
"""
function get_estimation_generation(
  id::Number,
)

    url_stub = "estimation/{id}/generation"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_reusable_version(
  id::Number,
  version::Number,
)
```

Get version of Reusable

# Arguments

- `id::Number` - 

- `version::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_reusable_version`.
"""
function get_reusable_version(
  id::Number,
  version::Number,
)

    url_stub = "reusable/{id}/version/{version}"
    args = Dict(
        "id" => id,
        "version" => version,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults(
  query,
  id::Number,
  sourceKey::String,
)
```

Returns all cohort analyses in the results/OHDSI schema for the given cohort_definition_id

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- List of all cohort analyses and their statuses for the given cohort_defintion_id

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults`.
"""
function get_cohortresults(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_vocabularies(
)
```

Get a collection of vocabularies from the vocabulary table in the default vocabulary

# Returns

- A collection of vocabularies

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_vocabularies`.
"""
function get_vocabulary_vocabularies(
)

    url_stub = "vocabulary/vocabularies"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ir_execute(
  analysis_id::Number,
  sourceKey::String,
)
```



# Arguments

- `analysis_id::Number` - 

- `sourceKey::String` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ir_execute`.
"""
function get_ir_execute(
  analysis_id::Number,
  sourceKey::String,
)

    url_stub = "ir/{analysis_id}/execute/{sourceKey}"
    args = Dict(
        "analysis_id" => analysis_id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset_version(
  id::Number,
  version::Number,
)
```

Get a specific version of a concept set

# Arguments

- `id::Number` - The concept set ID

- `version::Number` - The version ID

# Returns

- The concept set for the selected version

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset_version`.
"""
function get_conceptset_version(
  id::Number,
  version::Number,
)

    url_stub = "conceptset/{id}/version/{version}"
    args = Dict(
        "id" => id,
        "version" => version,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortdefinition_export_conceptset(
  id::Number,
)
```

Return concept sets used in a cohort definition as a_zip file. This method extracts the concept set from the specified cohort definition and serializes the elements as a CSV and_zips the results into a file with from 'cohortdefinition_{id}_export_zip".

# Arguments

- `id::Number` - a cohort definition id

# Returns

- a binary stream containing the_zip file with concept sets.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortdefinition_export_conceptset`.
"""
function get_cohortdefinition_export_conceptset(
  id::Number,
)

    url_stub = "cohortdefinition/{id}/export/conceptset"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization_generation_explore_prevalence(
  generationId::Number,
  analysisId::Number,
  cohortId::Number,
  covariateId::Number,
)
```



# Arguments

- `generationId::Number` - 

- `analysisId::Number` - 

- `cohortId::Number` - 

- `covariateId::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization_generation_explore_prevalence`.
"""
function get_cohortcharacterization_generation_explore_prevalence(
  generationId::Number,
  analysisId::Number,
  cohortId::Number,
  covariateId::Number,
)

    url_stub = "cohort-characterization/generation/{generationId}/explore/prevalence/{analysisId}/{cohortId}/{covariateId}"
    args = Dict(
        "generationId" => generationId,
        "analysisId" => analysisId,
        "cohortId" => cohortId,
        "covariateId" => covariateId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_datacompleteness(
  id::Number,
  sourceKey::String,
)
```

Provides a data completeness report for a cohort

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- List<DataCompletenessAttr>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_datacompleteness`.
"""
function get_cohortresults_datacompleteness(
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/datacompleteness"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_drugera(
  query,
  id::Number,
  drugId::Number,
  sourceKey::String,
)
```

Queries for cohort analysis drug era drilldown results for the given cohort definition id and drug id

# Arguments

- `id::Number` - The cohort ID

- `drugId::Number` - The drug concept ID

- `sourceKey::String` - The source key

# Returns

- CohortDrugEraDrilldown

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_drugera`.
"""
function get_cohortresults_drugera(
  query,
  id::Number,
  drugId::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/drugera/{drugId}"
    args = Dict(
        "id" => id,
        "drugId" => drugId,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_notifications_viewed(
)
```

Gets the date when notifications were last viewed

# Returns

- The date when notifications were last viewed

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_notifications_viewed`.
"""
function get_notifications_viewed(
)

    url_stub = "notifications/viewed"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_role(
  query,
)
```



> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_role`.
"""
function get_role(
  query,
)

    url_stub = "role"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_prediction_exists(
  query,
  id::Number,
)
```

Check to see if a prediction design exists by name

# Arguments

- `id::Number` - The prediction design id

# Returns

- 1 if a prediction design with the given name and id exist in WebAPI and 0 otherwise

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_prediction_exists`.
"""
function get_prediction_exists(
  query,
  id::Number,
)

    url_stub = "prediction/{id}/exists"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset_exportlist(
  query,
)
```

Exports a list of concept sets, based on the conceptSetList argument, to one or more comma separated value (CSV) file(s), compresses the files into a ZIP file and sends the ZIP file to the client.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset_exportlist`.
"""
function get_conceptset_exportlist(
  query,
)

    url_stub = "conceptset/exportlist"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_user_providers(
)
```



> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_user_providers`.
"""
function get_user_providers(
)

    url_stub = "user/providers"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortanalysis(
)
```

Returns all cohort analyses in the WebAPI database

# Returns

- List of all cohort analyses

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortanalysis`.
"""
function get_cohortanalysis(
)

    url_stub = "cohortanalysis/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_reusable(
  id::Number,
)
```



# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_reusable`.
"""
function get_reusable(
  id::Number,
)

    url_stub = "reusable/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ddl_cemresults(
  query,
)
```

Get DDL for Common Evidence Model results schema

# Returns

- SQL

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ddl_cemresults`.
"""
function get_ddl_cemresults(
  query,
)

    url_stub = "ddl/cemresults"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_featureanalysis_aggregates(
)
```

Get aggregation functions used in feature analyses

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_featureanalysis_aggregates`.
"""
function get_featureanalysis_aggregates(
)

    url_stub = "feature-analysis/aggregates"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cdmresults_person(
  sourceKey::String,
)
```

Queries for person report for the sourceKey

# Arguments

- `sourceKey::String` - 

# Returns

- CDMPersonSummary

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cdmresults_person`.
"""
function get_cdmresults_person(
  sourceKey::String,
)

    url_stub = "cdmresults/{sourceKey}/person"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ir_exists(
  query,
  id::Number,
)
```



# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ir_exists`.
"""
function get_ir_exists(
  query,
  id::Number,
)

    url_stub = "ir/{id}/exists"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_analyses(
  sourceKey::String,
  id::String,
)
```

Get the completed analyses IDs for the selected cohort and source key

# Arguments

- `sourceKey::String` - The source key

- `id::String` - The cohort ID

# Returns

- A list of completed analysis IDs

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_analyses`.
"""
function get_cohortresults_analyses(
  sourceKey::String,
  id::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/analyses"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortdefinition_version(
  id::Number,
)
```

Get list of versions of Cohort Definition

# Arguments

- `id::Number` - the cohort definition id

# Returns

- the list of VersionDTO containing version info for the cohort definition

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortdefinition_version`.
"""
function get_cohortdefinition_version(
  id::Number,
)

    url_stub = "cohortdefinition/{id}/version"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_featureanalysis_domains(
)
```

Feature analysis domains

# Returns

- Feature analysis domains such as DRUG, DRUG_ERA, MEASUREMENT, etc.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_featureanalysis_domains`.
"""
function get_featureanalysis_domains(
)

    url_stub = "feature-analysis/domains"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_pathwayanalysis_exists(
  query,
  id::Number,
)
```

Check that a pathway analysis name exists. This method checks to see if a pathway analysis name exists. The id parameter is used to 'ignore' an analysis from checking. This is used when you have an existing analysis which should be ignored when checking if the name already exists.

# Arguments

- `id::Number` - the pathway analysis id

# Returns

- a count of the number of pathway analysis designs with the same name

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_pathwayanalysis_exists`.
"""
function get_pathwayanalysis_exists(
  query,
  id::Number,
)

    url_stub = "pathway-analysis/{id}/exists"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_drughoi(
  sourceKey::String,
  key::String,
)
```

Retrieves a list of evidence for the specified health outcome of interest and drug as defined in the key parameter.

# Arguments

- `sourceKey::String` - The source key of the CEM daimon

- `key::String` - The key must be structured as {drugConceptId}-{hoiConceptId}

# Returns

- A list of evidence for the drug and HOI

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_drughoi`.
"""
function get_evidence_drughoi(
  sourceKey::String,
  key::String,
)

    url_stub = "evidence/{sourceKey}/drughoi/{key}"
    args = Dict(
        "sourceKey" => sourceKey,
        "key" => key,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_procedure(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)
```

Queries for cohort analysis procedures for the given cohort definition id and concept id

# Arguments

- `id::Number` - The cohort ID

- `conceptId::Number` - The procedure concept ID

- `sourceKey::String` - The source key

# Returns

- CohortProceduresDrillDown

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_procedure`.
"""
function get_cohortresults_procedure(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/procedure/{conceptId}"
    args = Dict(
        "id" => id,
        "conceptId" => conceptId,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_export_zip(
  id::Number,
  sourceKey::String,
)
```

Export the cohort analysis results to a ZIP file

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source Key

# Returns

- A response containing the .ZIP file of results

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_export_zip`.
"""
function get_cohortresults_export_zip(
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/export_zip"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortanalysis(
  id::Number,
)
```

Returns all cohort analyses in the WebAPI database for the given cohort_definition_id

# Arguments

- `id::Number` - The cohort definition identifier

# Returns

- List of all cohort analyses and their statuses for the given cohort_definition_id

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortanalysis`.
"""
function get_cohortanalysis(
  id::Number,
)

    url_stub = "cohortanalysis/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_observation(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)
```

Queries for cohort analysis observation drilldown results for the given cohort definition id and observation concept id

# Arguments

- `id::Number` - The cohort ID

- `conceptId::Number` - The observation concept ID

- `sourceKey::String` - The source key

# Returns

- CohortObservationDrilldown

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_observation`.
"""
function get_cohortresults_observation(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/observation/{conceptId}"
    args = Dict(
        "id" => id,
        "conceptId" => conceptId,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_measurement(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)
```

Queries for cohort analysis measurement drilldown results for the given cohort definition id and measurement concept id

# Arguments

- `id::Number` - The cohort ID

- `conceptId::Number` - The measurement concept ID

- `sourceKey::String` - The source key

# Returns

- CohortMeasurementDrilldown

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_measurement`.
"""
function get_cohortresults_measurement(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/measurement/{conceptId}"
    args = Dict(
        "id" => id,
        "conceptId" => conceptId,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_summarydata(
  id::Number,
  sourceKey::String,
)
```

Returns the summary for the cohort

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- CohortSummary

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_summarydata`.
"""
function get_cohortresults_summarydata(
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/summarydata"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_featureanalysis(
  body,
)
```

Get a pagable list of all feature analyses available in WebAPI

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_featureanalysis`.
"""
function get_featureanalysis(
  body,
)

    url_stub = "feature-analysis/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_drugera(
  query,
  id::Number,
  sourceKey::String,
)
```

Queries for cohort analysis drug era treemap results for the given cohort definition id

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- List<HierarchicalConceptRecord>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_drugera`.
"""
function get_cohortresults_drugera(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/drugera"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_concept_ancestoranddescendant(
  sourceKey::String,
  id::Number,
)
```

Get ancestor and descendant concepts for the selected concept identifier from a source.

# Arguments

- `sourceKey::String` - The source containing the vocabulary

- `id::Number` - The concept ID

# Returns

- A collection of related concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_concept_ancestoranddescendant`.
"""
function get_vocabulary_concept_ancestoranddescendant(
  sourceKey::String,
  id::Number,
)

    url_stub = "vocabulary/{sourceKey}/concept/{id}/ancestorAndDescendant"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cdmresults(
  domain::String,
  conceptId::Number,
  sourceKey::String,
)
```

Queries for drilldown results

# Arguments

- `domain::String` - The domain for the drilldown

- `conceptId::Number` - The concept ID

- `sourceKey::String` - The source key

# Returns

- The JSON results

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cdmresults`.
"""
function get_cdmresults(
  domain::String,
  conceptId::Number,
  sourceKey::String,
)

    url_stub = "cdmresults/{sourceKey}/{domain}/{conceptId}"
    args = Dict(
        "domain" => domain,
        "conceptId" => conceptId,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_role(
  roleId::Number,
)
```



# Arguments

- `roleId::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_role`.
"""
function get_role(
  roleId::Number,
)

    url_stub = "role/{roleId}"
    args = Dict(
        "roleId" => roleId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_estimation(
  id::Number,
)
```

Used to retrieve an existing existing estimation design by ID.

# Arguments

- `id::Number` - The ID of the estimation design

# Returns

- An EstimationDTO which contains the estimation design.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_estimation`.
"""
function get_estimation(
  id::Number,
)

    url_stub = "estimation/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset_expression(
  id::Number,
  sourceKey::String,
)
```

Get the concept set expression by identifier and source key

# Arguments

- `id::Number` - The concept set ID

- `sourceKey::String` - The source key

# Returns

- The concept set expression

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset_expression`.
"""
function get_conceptset_expression(
  id::Number,
  sourceKey::String,
)

    url_stub = "conceptset/{id}/expression/{sourceKey}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_pathwayanalysis_export(
  id::Number,
)
```

Export the pathway analysis deign as JSON

# Arguments

- `id::Number` - the design id to export

# Returns

- a String containing the pathway analysis design as JSON

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_pathwayanalysis_export`.
"""
function get_pathwayanalysis_export(
  id::Number,
)

    url_stub = "pathway-analysis/{id}/export"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_user_import_groups(
  query,
  type::String,
)
```



# Arguments

- `type::String` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_user_import_groups`.
"""
function get_user_import_groups(
  query,
  type::String,
)

    url_stub = "user/import/{type}/groups"
    args = Dict(
        "type" => type,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_prediction_export(
  id::Number,
)
```

Used to export an existing existing prediction design by ID. This is used when transferring the object outside of WebAPI.

# Arguments

- `id::Number` - The ID of the prediction design

# Returns

- An EstimationAnalysisImpl which resolves all references to cohorts, concept sets, etc and contains the full prediction design for export.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_prediction_export`.
"""
function get_prediction_export(
  id::Number,
)

    url_stub = "prediction/{id}/export"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortdefinition_report(
  query,
  id::Number,
  sourceKey::String,
)
```

Get the Inclusion Rule report for the specified source and mode The mode refers to the results for either 'all events' (0) or 'best event' (1). The best event report limits the selected entry event to one-per-person, and therefore this result can be considered a 'by person' report.

# Arguments

- `id::Number` - a cohort definition id

- `sourceKey::String` - the source to fetch results from

# Returns

- a binary stream containing the_zip file with concept sets.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortdefinition_report`.
"""
function get_cohortdefinition_report(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortdefinition/{id}/report/{sourceKey}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_search(
  query,
  sourceKey::String,
)
```

Search for a concept based on a query using the default vocabulary source. NOTE: This method uses the query as part of the URL query string

# Arguments

- `sourceKey::String` - The source key holding the OMOP vocabulary

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_search`.
"""
function get_vocabulary_search(
  query,
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/search"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization_generation_result_count(
  generationId::Number,
)
```

Get the total number of analyses in a cohort characterization

# Arguments

- `generationId::Number` - 

# Returns

- The total number of analyses in the given cohort characterization

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization_generation_result_count`.
"""
function get_cohortcharacterization_generation_result_count(
  generationId::Number,
)

    url_stub = "cohort-characterization/generation/{generationId}/result/count"
    args = Dict(
        "generationId" => generationId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortsample(
  cohortDefinitionId::Number,
  sourceKey::String,
)
```

Get information about cohort samples for a data source

# Arguments

- `cohortDefinitionId::Number` - The id for an existing cohort definition

- `sourceKey::String` - 

# Returns

- JSON containing information about cohort samples

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortsample`.
"""
function get_cohortsample(
  cohortDefinitionId::Number,
  sourceKey::String,
)

    url_stub = "cohortsample/{cohortDefinitionId}/{sourceKey}"
    args = Dict(
        "cohortDefinitionId" => cohortDefinitionId,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset_generationinfo(
  id::Number,
)
```

Get the concept set generation information for the selected concept set ID. This function only works with the configuration of the CEM data source.

# Arguments

- `id::Number` - The concept set identifier.

# Returns

- A collection of concept set generation info objects

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset_generationinfo`.
"""
function get_conceptset_generationinfo(
  id::Number,
)

    url_stub = "conceptset/{id}/generationinfo"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_vocabularies(
  sourceKey::String,
)
```

Get a collection of vocabularies from the vocabulary table in the selected source key.

# Arguments

- `sourceKey::String` - The source containing the vocabulary

# Returns

- A collection of vocabularies

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_vocabularies`.
"""
function get_vocabulary_vocabularies(
  sourceKey::String,
)

    url_stub = "vocabulary/{sourceKey}/vocabularies"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortsample_hassamples(
  cohortDefinitionId::Number,
)
```

Does an existing cohort have samples?

# Arguments

- `cohortDefinitionId::Number` - 

# Returns

- true or false

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortsample_hassamples`.
"""
function get_cohortsample_hassamples(
  cohortDefinitionId::Number,
)

    url_stub = "cohortsample/has-samples/{cohortDefinitionId}"
    args = Dict(
        "cohortDefinitionId" => cohortDefinitionId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_role_permissions(
  roleId::Number,
)
```



# Arguments

- `roleId::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_role_permissions`.
"""
function get_role_permissions(
  roleId::Number,
)

    url_stub = "role/{roleId}/permissions"
    args = Dict(
        "roleId" => roleId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortdefinition_info(
  id::Number,
)
```

Returns a list of cohort generation info objects. Cohort generation info objects refers to the information related to the generation on a source. This includes information about the starting time, duration, and execution status. This method returns the generation information for any source the user has access to.

# Arguments

- `id::Number` - - the Cohort Definition ID to generate

# Returns

- information about the Cohort Analysis Job for each source

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortdefinition_info`.
"""
function get_cohortdefinition_info(
  id::Number,
)

    url_stub = "cohortdefinition/{id}/info"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ir_report(
  query,
  id::Number,
  sourceKey::String,
)
```



# Arguments

- `id::Number` - 

- `sourceKey::String` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ir_report`.
"""
function get_ir_report(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "ir/{id}/report/{sourceKey}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cdmresults_observationperiod(
  sourceKey::String,
)
```

Queries for observation period report for the given sourceKey

# Arguments

- `sourceKey::String` - 

# Returns

- CDMDataDensity

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cdmresults_observationperiod`.
"""
function get_cdmresults_observationperiod(
  sourceKey::String,
)

    url_stub = "cdmresults/{sourceKey}/observationPeriod"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset_version_expression(
  id::Number,
  version::Number,
  sourceKey::String,
)
```

Get the concept set expression by version for the selected source key. NOTE: This method requires the specification of a source key but it does not appear to be used by the underlying code.

# Arguments

- `id::Number` - The concept set identifier

- `version::Number` - The version of the concept set

- `sourceKey::String` - The source key

# Returns

- The concept set expression for the selected version

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset_version_expression`.
"""
function get_conceptset_version_expression(
  id::Number,
  version::Number,
  sourceKey::String,
)

    url_stub = "conceptset/{id}/version/{version}/expression/{sourceKey}"
    args = Dict(
        "id" => id,
        "version" => version,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_source_daimon_priority(
)
```

Get the first daimon (ad associated source) that has priority. In the event of a tie, the first source searched wins.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_source_daimon_priority`.
"""
function get_source_daimon_priority(
)

    url_stub = "source/daimon/priority"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_tag_assignmentpermissions(
)
```

Tags assignment permissions for current user

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_tag_assignmentpermissions`.
"""
function get_tag_assignmentpermissions(
)

    url_stub = "tag/assignmentPermissions"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_mapping(
  conceptId::Number,
)
```

<a href="https://github.com/OHDSI/Penelope">PENELOPE</a> function: search the COHORT_CONCEPT_MAP for the selected cohortId in the WebAPI DB

# Arguments

- `conceptId::Number` - The concept Id of interest

# Returns

- A list of cohorts for the specified conceptId

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_mapping`.
"""
function get_evidence_mapping(
  conceptId::Number,
)

    url_stub = "evidence/mapping/{conceptId}"
    args = Dict(
        "conceptId" => conceptId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset_exists(
  query,
  id::Number,
)
```

Check if a concept set with the same name exists in the WebAPI database. The name is checked against the selected concept set ID to ensure that only the selected concept set ID has the name specified.

# Arguments

- `id::Number` - The concept set ID

# Returns

- The count of concept sets with the name, excluding the specified concept set ID.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset_exists`.
"""
function get_conceptset_exists(
  query,
  id::Number,
)

    url_stub = "conceptset/{id}/exists"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortdefinition(
  id::Number,
)
```

Returns the 'raw' cohort definition for the given id. 'Raw' means that the cohort expression is returned as a string, and not as a concrete CohortExpression class. This method is maintained for legacy comparability.

# Arguments

- `id::Number` - The cohort definition id

# Returns

- The cohort definition JSON expression

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortdefinition`.
"""
function get_cohortdefinition(
  id::Number,
)

    url_stub = "cohortdefinition/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_permission_access_suggest(
  query,
)
```

Get the roles matching the roleSearch value

# Returns

- The list of roles

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_permission_access_suggest`.
"""
function get_permission_access_suggest(
  query,
)

    url_stub = "permission/access/suggest"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization_version(
  id::Number,
  version::Number,
)
```

Get version of Cohort Characterization

# Arguments

- `id::Number` - 

- `version::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization_version`.
"""
function get_cohortcharacterization_version(
  id::Number,
  version::Number,
)

    url_stub = "cohort-characterization/{id}/version/{version}"
    args = Dict(
        "id" => id,
        "version" => version,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_drugrollup(
  sourceKey::String,
  id::Number,
  filter::String,
)
```

Originally provided a roll up of evidence from LAERTES

# Arguments

- `sourceKey::String` - The source key of the CEM daimon

- `id::Number` - The RxNorm drug conceptId

- `filter::String` - Specified the type of rollup level (ingredient, clinical drug, branded drug)

# Returns

- A list of evidence rolled up

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_drugrollup`.
"""
function get_evidence_drugrollup(
  sourceKey::String,
  id::Number,
  filter::String,
)

    url_stub = "evidence/{sourceKey}/drugrollup/{filter}/{id}"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
        "filter" => filter,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_cohortspecificdrug(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)
```

Queries for cohort analysis drug drilldown results for the given cohort definition id and concept id

# Arguments

- `id::Number` - The cohort ID

- `conceptId::Number` - The drug concept ID

- `sourceKey::String` - The source key

# Returns

- List<ScatterplotRecord>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_cohortspecificdrug`.
"""
function get_cohortresults_cohortspecificdrug(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/cohortspecificdrug/{conceptId}"
    args = Dict(
        "id" => id,
        "conceptId" => conceptId,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortdefinition_version(
  id::Number,
  version::Number,
)
```

Get version of Cohort Definition

# Arguments

- `id::Number` - The cohort definition id

- `version::Number` - The version to fetch

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortdefinition_version`.
"""
function get_cohortdefinition_version(
  id::Number,
  version::Number,
)

    url_stub = "cohortdefinition/{id}/version/{version}"
    args = Dict(
        "id" => id,
        "version" => version,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_members(
  id::Number,
  sourceKey::String,
  min::Number,
  max::Number,
)
```

Returns the person identifiers of all members of a generated cohort definition identifier

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

- `min::Number` - The minimum number of persons to return

- `max::Number` - The maximum number of persons to return

# Returns

- Collection<CohortPerson>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_members`.
"""
function get_cohortresults_members(
  id::Number,
  sourceKey::String,
  min::Number,
  max::Number,
)

    url_stub = "cohortresults/{sourceKey}/{id}/members/{min}-{max}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
        "min" => min,
        "max" => max,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_user_import_job_history(
  id::Number,
)
```

Get the user import job history

# Arguments

- `id::Number` - The job ID

# Returns

- The job history

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_user_import_job_history`.
"""
function get_user_import_job_history(
  id::Number,
)

    url_stub = "user/import/job/{id}/history"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_conditionera(
  query,
  id::Number,
  conditionId::Number,
  sourceKey::String,
)
```

Queries for cohort analysis condition era drilldown results for the given cohort definition id and condition id

# Arguments

- `id::Number` - The cohort ID

- `conditionId::Number` - The condition ID

- `sourceKey::String` - The source key

# Returns

- The CohortConditionEraDrilldown object

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_conditionera`.
"""
function get_cohortresults_conditionera(
  query,
  id::Number,
  conditionId::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/conditionera/{conditionId}"
    args = Dict(
        "id" => id,
        "conditionId" => conditionId,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_user(
)
```



> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_user`.
"""
function get_user(
)

    url_stub = "user"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset(
  id::Number,
)
```

Get the concept set based in the identifier

# Arguments

- `id::Number` - The concept set ID

# Returns

- The concept set definition

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset`.
"""
function get_conceptset(
  id::Number,
)

    url_stub = "conceptset/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_dashboard(
  query,
  id::Number,
  sourceKey::String,
)
```

Queries for cohort analysis dashboard for the given cohort definition id

# Arguments

- `id::Number` - The cohort definition id

- `sourceKey::String` - 

# Returns

- CohortDashboard

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_dashboard`.
"""
function get_cohortresults_dashboard(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/dashboard"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohort(
  id::Number,
)
```

Retrieves all cohort entities for the given cohort definition id from the COHORT table

# Arguments

- `id::Number` - Cohort Definition id

# Returns

- List of CohortEntity

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohort`.
"""
function get_cohort(
  id::Number,
)

    url_stub = "cohort/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ir_info(
  id::Number,
)
```



# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ir_info`.
"""
function get_ir_info(
  id::Number,
)

    url_stub = "ir/{id}/info"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_job_execution(
  query,
)
```

<i>Variation of spring-batch-admin support: org.springframework.batch.admin.web.BatchJobExecutionsController</i>. <p> Return a paged collection of job executions. Filter for a given job. Returned in pages.

# Returns

- collection of JobExecutionInfo

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_job_execution`.
"""
function get_job_execution(
  query,
)

    url_stub = "job/execution"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence(
  sourceKey::String,
  id::Number,
)
```

Retrieve all evidence from Common Evidence Model (CEM) for a given conceptId

# Arguments

- `sourceKey::String` - The source key of the CEM daimon

- `id::Number` - The conceptId of interest

# Returns

- A list of evidence matching the conceptId of interest

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence`.
"""
function get_evidence(
  sourceKey::String,
  id::Number,
)

    url_stub = "evidence/{sourceKey}/{id}"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_executionservice_status(
)
```

Get the execution status of the Arachne Execution Engine

# Returns

- The StatusResponse

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_executionservice_status`.
"""
function get_executionservice_status(
)

    url_stub = "executionservice/status"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_pathwayanalysis(
  id::Number,
)
```

Get the pathway analysis design.

# Arguments

- `id::Number` - the design id

# Returns

- a pathway analysis design for the given id

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_pathwayanalysis`.
"""
function get_pathwayanalysis(
  id::Number,
)

    url_stub = "pathway-analysis/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_estimation_exists(
  query,
  id::Number,
)
```

Check to see if an estimation design exists by name

# Arguments

- `id::Number` - The estimation design id

# Returns

- 1 if an estimation design with the given name and id exist in WebAPI and 0 otherwise

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_estimation_exists`.
"""
function get_estimation_exists(
  query,
  id::Number,
)

    url_stub = "estimation/{id}/exists"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_healthcareutilization_drug(
  query,
  id::Number,
  sourceKey::String,
  window::Enum,
)
```

Get the healthcare utilization summary report by drug and cost type concept

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

- `window::Enum` - The time window

# Returns

- HealthcareDrugUtilizationSummary

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_healthcareutilization_drug`.
"""
function get_cohortresults_healthcareutilization_drug(
  query,
  id::Number,
  sourceKey::String,
  window::Enum,
)

    url_stub = "cohortresults/{sourceKey}/{id}/healthcareutilization/drug/{window}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
        "window" => window,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_visit(
  query,
  id::Number,
  sourceKey::String,
)
```

Queries for cohort analysis visit treemap results for the given cohort definition id

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- List<HierarchicalConceptRecord>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_visit`.
"""
function get_cohortresults_visit(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/visit"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_tag(
  id::Number,
)
```

Return tag by ID.

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_tag`.
"""
function get_tag(
  id::Number,
)

    url_stub = "tag/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_tornado(
  sourceKey::String,
  id::Number,
)
```

Retrieves the tornado plot

# Arguments

- `sourceKey::String` - The source key

- `id::Number` - The cohort definition id

# Returns

- The tornado plot data

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_tornado`.
"""
function get_cohortresults_tornado(
  sourceKey::String,
  id::Number,
)

    url_stub = "cohortresults/{sourceKey}/{id}/tornado"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ir(
  id::Number,
)
```



# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ir`.
"""
function get_ir(
  id::Number,
)

    url_stub = "ir/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization_export_conceptset(
  id::Number,
)
```

Get csv files containing concept sets used in a characterization analysis

# Arguments

- `id::Number` - The id for a cohort characterization analysis

# Returns

- A_zip file containing three csv files (mappedConcepts, includedConcepts, conceptSetExpression)

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization_export_conceptset`.
"""
function get_cohortcharacterization_export_conceptset(
  id::Number,
)

    url_stub = "cohort-characterization/{id}/export/conceptset"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset_expression(
  id::Number,
)
```

Get the concept set expression by identifier

# Arguments

- `id::Number` - The concept set identifier

# Returns

- The concept set expression

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset_expression`.
"""
function get_conceptset_expression(
  id::Number,
)

    url_stub = "conceptset/{id}/expression"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_pathwayanalysis_version(
  id::Number,
)
```

Get list of versions of Pathway Analysis

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_pathwayanalysis_version`.
"""
function get_pathwayanalysis_version(
  id::Number,
)

    url_stub = "pathway-analysis/{id}/version"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ir_version(
  id::Number,
)
```

Get list of versions of IR Analysis

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ir_version`.
"""
function get_ir_version(
  id::Number,
)

    url_stub = "ir/{id}/version"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cdmresults_dashboard(
  sourceKey::String,
)
```

Queries for dashboard report for the sourceKey

# Arguments

- `sourceKey::String` - 

# Returns

- CDMDashboard

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cdmresults_dashboard`.
"""
function get_cdmresults_dashboard(
  sourceKey::String,
)

    url_stub = "cdmresults/{sourceKey}/dashboard"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_role_users(
  roleId::Number,
)
```



# Arguments

- `roleId::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_role_users`.
"""
function get_role_users(
  roleId::Number,
)

    url_stub = "role/{roleId}/users"
    args = Dict(
        "roleId" => roleId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_summaryanalyses(
  id::Number,
  sourceKey::String,
)
```

Returns the summary for the cohort

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- CohortSummary

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_summaryanalyses`.
"""
function get_cohortresults_summaryanalyses(
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/summaryanalyses"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_raw(
  query,
  id::Number,
  analysis_group::String,
  analysis_name::String,
  sourceKey::String,
)
```

Queries for cohort analysis results for the given cohort definition id

# Arguments

- `id::Number` - cohort_defintion id

- `analysis_group::String` - Name of the analysisGrouping under the /resources/cohortresults/sql/ directory

- `analysis_name::String` - Name of the analysis, currently the same name as the sql file under analysisGroup

- `sourceKey::String` - the source to retrieve results

# Returns

- List of key, value pairs

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_raw`.
"""
function get_cohortresults_raw(
  query,
  id::Number,
  analysis_group::String,
  analysis_name::String,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/raw/{analysis_group}/{analysis_name}"
    args = Dict(
        "id" => id,
        "analysis_group" => analysis_group,
        "analysis_name" => analysis_name,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_source(
  key::String,
)
```

Get source by key

# Arguments

- `key::String` - 

# Returns

- Metadata for a single Source that matches the <code>sourceKey</code>.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_source`.
"""
function get_source(
  key::String,
)

    url_stub = "source/{key}"
    args = Dict(
        "key" => key,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_condition(
  query,
  sourceKey::String,
  id::Number,
  conditionId::Number,
)
```

Queries for cohort analysis condition drilldown results for the given cohort definition id and condition id

# Arguments

- `sourceKey::String` - The source key

- `id::Number` - The cohort ID

- `conditionId::Number` - The condition concept ID

# Returns

- The CohortConditionDrilldown detail object

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_condition`.
"""
function get_cohortresults_condition(
  query,
  sourceKey::String,
  id::Number,
  conditionId::Number,
)

    url_stub = "cohortresults/{sourceKey}/{id}/condition/{conditionId}"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
        "conditionId" => conditionId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_job_execution(
  jobId::Number,
  executionId::Number,
)
```

Get the job execution information by execution ID and job ID

# Arguments

- `jobId::Number` - The job ID

- `executionId::Number` - The execution ID

# Returns

- JobExecutionResource

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_job_execution`.
"""
function get_job_execution(
  jobId::Number,
  executionId::Number,
)

    url_stub = "job/{jobId}/execution/{executionId}"
    args = Dict(
        "jobId" => jobId,
        "executionId" => executionId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_job(
  jobId::Number,
)
```

Get the job information by job ID

# Arguments

- `jobId::Number` - The job ID

# Returns

- The job information

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_job`.
"""
function get_job(
  jobId::Number,
)

    url_stub = "job/{jobId}"
    args = Dict(
        "jobId" => jobId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_user_import_test(
  type::String,
)
```



# Arguments

- `type::String` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_user_import_test`.
"""
function get_user_import_test(
  type::String,
)

    url_stub = "user/import/{type}/test"
    args = Dict(
        "type" => type,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_healthcareutilization_drugtypes(
  query,
  id::Number,
  sourceKey::String,
)
```

Get the drug type concepts for the selected drug concept ID

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- A list of concepts of drug types

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_healthcareutilization_drugtypes`.
"""
function get_cohortresults_healthcareutilization_drugtypes(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/healthcareutilization/drugtypes"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization_version(
  id::Number,
)
```

Get list of versions of Cohort Characterization

# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization_version`.
"""
function get_cohortcharacterization_version(
  id::Number,
)

    url_stub = "cohort-characterization/{id}/version"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_conceptofinterest(
  conceptId::Number,
)
```

<a href="https://github.com/OHDSI/Penelope">PENELOPE</a> function: reference to a manually curated table related concept_of_interest in WebAPI for use with PENELOPE. This will be depreciated in a future release.

# Arguments

- `conceptId::Number` - The conceptId of interest

# Returns

- A list of concepts based on the conceptId of interest

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_conceptofinterest`.
"""
function get_evidence_conceptofinterest(
  conceptId::Number,
)

    url_stub = "evidence/conceptofinterest/{conceptId}"
    args = Dict(
        "conceptId" => conceptId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_tag_search(
  query,
)
```

Returns list of tags, which names contain a provided substring.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_tag_search`.
"""
function get_tag_search(
  query,
)

    url_stub = "tag/search"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_estimation_export(
  id::Number,
)
```

Used to export an existing existing estimation design by ID. This is used when transferring the object outside of WebAPI.

# Arguments

- `id::Number` - The ID of the estimation design

# Returns

- An EstimationAnalysisImpl which resolves all references to cohorts, concept sets, etc and contains the full estimation design for export.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_estimation_export`.
"""
function get_estimation_export(
  id::Number,
)

    url_stub = "estimation/{id}/export"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortanalysis_summary(
  id::Number,
)
```

Returns the summary for the cohort

# Arguments

- `id::Number` - - the cohort_definition id

# Returns

- Summary which includes the base cohort_definition, the cohort analyses list and their statuses for this cohort, and a base set of common cohort results that may or may not yet have been ran

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortanalysis_summary`.
"""
function get_cohortanalysis_summary(
  id::Number,
)

    url_stub = "cohortanalysis/{id}/summary"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_death(
  query,
  id::Number,
  sourceKey::String,
)
```

Queries for cohort analysis death data for the given cohort definition id

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- CohortDeathData

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_death`.
"""
function get_cohortresults_death(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/death"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_concept(
  sourceKey::String,
  id::Number,
)
```

Get a concept based on the concept identifier from the specified source

# Arguments

- `sourceKey::String` - The source containing the vocabulary

- `id::Number` - The concept ID to find

# Returns

- The concept details

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_concept`.
"""
function get_vocabulary_concept(
  sourceKey::String,
  id::Number,
)

    url_stub = "vocabulary/{sourceKey}/concept/{id}"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization_design(
  id::Number,
)
```

Get the complete design specification for a single cohort characterization.

# Arguments

- `id::Number` - The id for an existing cohort characterization

# Returns

- JSON containing the cohort characterization specification

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization_design`.
"""
function get_cohortcharacterization_design(
  id::Number,
)

    url_stub = "cohort-characterization/{id}/design"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_drug(
  sourceKey::String,
  id::Number,
)
```

Retrieves a list of evidence for the specified drug conceptId

# Arguments

- `sourceKey::String` - The source key containing the CEM daimon

- `id::Number` - - An RxNorm Drug Concept Id

# Returns

- A list of evidence

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_drug`.
"""
function get_evidence_drug(
  sourceKey::String,
  id::Number,
)

    url_stub = "evidence/{sourceKey}/drug/{id}"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_user_permissions(
  userId::Number,
)
```



# Arguments

- `userId::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_user_permissions`.
"""
function get_user_permissions(
  userId::Number,
)

    url_stub = "user/{userId}/permissions"
    args = Dict(
        "userId" => userId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_domains(
)
```

Get a collection of domains from the domain table in the default vocabulary.

# Returns

- A collection of domains

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_domains`.
"""
function get_vocabulary_domains(
)

    url_stub = "vocabulary/domains"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ddl_achilles(
  query,
)
```

Get DDL for Achilles results tables

# Returns

- SQL

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ddl_achilles`.
"""
function get_ddl_achilles(
  query,
)

    url_stub = "ddl/achilles"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_observation(
  query,
  id::Number,
  sourceKey::String,
)
```

Queries for cohort analysis for observation treemap

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- List<HierarchicalConceptRecord>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_observation`.
"""
function get_cohortresults_observation(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/observation"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_entropy(
  id::Number,
  sourceKey::String,
)
```

Provide an entropy report for a cohort

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- List<EntropyAttr>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_entropy`.
"""
function get_cohortresults_entropy(
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/entropy"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_ddl_results(
  query,
)
```

Get DDL for results schema

# Returns

- SQL to create tables in results schema

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_ddl_results`.
"""
function get_ddl_results(
  query,
)

    url_stub = "ddl/results"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_observationperiod(
  query,
  id::Number,
  sourceKey::String,
)
```

Queries for cohort analysis observation period for the given cohort definition id

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- CohortObservationPeriod

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_observationperiod`.
"""
function get_cohortresults_observationperiod(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/observationperiod"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_estimation(
)
```

Used to retrieve all estimation designs in the WebAPI database.

# Returns

- A list of all estimation design names and identifiers

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_estimation`.
"""
function get_estimation(
)

    url_stub = "estimation/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_pathwayanalysis_generation(
  generationId::Number,
)
```

Return a single generation info for the given generation id.

# Arguments

- `generationId::Number` - 

# Returns

- a CommonGenerationDTO for the given generation id

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_pathwayanalysis_generation`.
"""
function get_pathwayanalysis_generation(
  generationId::Number,
)

    url_stub = "pathway-analysis/generation/{generationId}"
    args = Dict(
        "generationId" => generationId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset_items(
  id::Number,
)
```

Get the concept set items for a selected concept set ID.

# Arguments

- `id::Number` - The concept set identifier

# Returns

- A list of concept set items

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset_items`.
"""
function get_conceptset_items(
  id::Number,
)

    url_stub = "conceptset/{id}/items"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset_version(
  id::Number,
)
```

Get a list of versions of the selected concept set

# Arguments

- `id::Number` - The concept set ID

# Returns

- A list of version information

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset_version`.
"""
function get_conceptset_version(
  id::Number,
)

    url_stub = "conceptset/{id}/version"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_featureanalysis_exists(
  query,
  id::Number,
)
```

Does a feature analysis name already exist?

# Arguments

- `id::Number` - The id for a new feature analysis that does not already exist

# Returns

- 1 if the name conflicts with an existing feature analysis name and 0 otherwise

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_featureanalysis_exists`.
"""
function get_featureanalysis_exists(
  query,
  id::Number,
)

    url_stub = "feature-analysis/{id}/exists"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset_export(
  id::String,
)
```

Exports a single concept set to a comma separated value (CSV) file, compresses to a ZIP file and sends to the client.

# Arguments

- `id::String` - The concept set ID

# Returns

- A_zip file containing the exported concept set

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset_export`.
"""
function get_conceptset_export(
  id::String,
)

    url_stub = "conceptset/{id}/export"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortdefinition_exists(
  query,
  id::Number,
)
```

Check that a cohort exists. This method checks to see if a cohort definition name exists. The id parameter is used to 'ignore' a cohort definition from checking. This is used when you have an existing cohort definition which should be ignored when checking if the name already exists.

# Arguments

- `id::Number` - The cohort definition id

# Returns

- 1 if the a cohort with the given name and id exist in WebAPI and 0 otherwise

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortdefinition_exists`.
"""
function get_cohortdefinition_exists(
  query,
  id::Number,
)

    url_stub = "cohortdefinition/{id}/exists"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cdmresults_death(
  sourceKey::String,
)
```

Queries for death report for the given sourceKey Queries for treemap results

# Arguments

- `sourceKey::String` - 

# Returns

- CDMDataDensity

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cdmresults_death`.
"""
function get_cdmresults_death(
  sourceKey::String,
)

    url_stub = "cdmresults/{sourceKey}/death"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_evidencedetails(
  query,
  sourceKey::String,
)
```

Originally provided an evidence details from LAERTES

# Arguments

- `sourceKey::String` - The source key of the CEM daimon

# Returns

- A list of evidence details

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_evidencedetails`.
"""
function get_evidence_evidencedetails(
  query,
  sourceKey::String,
)

    url_stub = "evidence/{sourceKey}/evidencedetails"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_breakdown(
  id::Number,
  sourceKey::String,
)
```

Returns breakdown with counts about people in cohort

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- Collection<CohortBreakdown>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_breakdown`.
"""
function get_cohortresults_breakdown(
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/breakdown"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_prediction_generation_result(
  generationId::Number,
)
```

Get a prediction design generation result.

# Arguments

- `generationId::Number` - The id for the prediction generation

# Returns

- Response Streams a binary ZIP file with the results

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_prediction_generation_result`.
"""
function get_prediction_generation_result(
  generationId::Number,
)

    url_stub = "prediction/generation/{generationId}/result"
    args = Dict(
        "generationId" => generationId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_prediction(
  id::Number,
)
```

Used to retrieve an existing existing prediction design by ID.

# Arguments

- `id::Number` - The ID of the prediction design

# Returns

- An EstimationDTO which contains the prediction design.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_prediction`.
"""
function get_prediction(
  id::Number,
)

    url_stub = "prediction/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_procedure(
  query,
  id::Number,
  sourceKey::String,
)
```

Queries for cohort analysis procedure treemap results for the given cohort definition id

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- List<HierarchicalConceptRecord>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_procedure`.
"""
function get_cohortresults_procedure(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/procedure"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_estimation_generation_result(
  generationId::Number,
)
```

Get an estimation design generation result.

# Arguments

- `generationId::Number` - The id for the estimation generation

# Returns

- Response Streams a binary ZIP file with the results

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_estimation_generation_result`.
"""
function get_estimation_generation_result(
  generationId::Number,
)

    url_stub = "estimation/generation/{generationId}/result"
    args = Dict(
        "generationId" => generationId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cdmresults_warmcache(
  sourceKey::String,
)
```

Warm the results cache for a selected source

# Arguments

- `sourceKey::String` - The source key

# Returns

- The job execution information

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cdmresults_warmcache`.
"""
function get_cdmresults_warmcache(
  sourceKey::String,
)

    url_stub = "cdmresults/{sourceKey}/warmCache"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset(
)
```

Get the full list of concept sets in the WebAPI database

# Returns

- A list of all concept sets in the WebAPI database

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset`.
"""
function get_conceptset(
)

    url_stub = "conceptset/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_study(
  cohortId::Number,
)
```

<a href="https://github.com/OHDSI/Penelope">PENELOPE</a> function: search the cohort_study table for the selected cohortId in the WebAPI DB

# Arguments

- `cohortId::Number` - The cohort Id

# Returns

- A list of studies related to the cohort

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_study`.
"""
function get_evidence_study(
  cohortId::Number,
)

    url_stub = "evidence/study/{cohortId}"
    args = Dict(
        "cohortId" => cohortId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cdmresults(
  domain::String,
  sourceKey::String,
)
```

Queries for domain treemap results

# Arguments

- `domain::String` - 

- `sourceKey::String` - 

# Returns

- List<ArrayNode>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cdmresults`.
"""
function get_cdmresults(
  domain::String,
  sourceKey::String,
)

    url_stub = "cdmresults/{sourceKey}/{domain}"
    args = Dict(
        "domain" => domain,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_person(
  query,
  id::Number,
  sourceKey::String,
)
```

Queries for cohort analysis person results for the given cohort definition id

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_person`.
"""
function get_cohortresults_person(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/person"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_tag(
)
```

Returns list of all tags.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_tag`.
"""
function get_tag(
)

    url_stub = "tag/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_healthcareutilization_drug(
  query,
  id::Number,
  sourceKey::String,
  window::Enum,
  drugConceptId::Number,
)
```

Get the healthcare utilization detail report by drug and cost type concept

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

- `window::Enum` - The time window

- `drugConceptId::Number` - The drug concept ID

# Returns

- HealthcareDrugUtilizationDetail

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_healthcareutilization_drug`.
"""
function get_cohortresults_healthcareutilization_drug(
  query,
  id::Number,
  sourceKey::String,
  window::Enum,
  drugConceptId::Number,
)

    url_stub = "cohortresults/{sourceKey}/{id}/healthcareutilization/drug/{window}/{drugConceptId}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
        "window" => window,
        "drugConceptId" => drugConceptId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_source_refresh(
)
```

Refresh cached CDM database metadata

# Returns

- A list of all CDM sources with the ID, name, SQL dialect, and key for each source (same as the 'sources' endpoint) after refreshing the cached sourced data.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_source_refresh`.
"""
function get_source_refresh(
)

    url_stub = "source/refresh"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_visit(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)
```

Queries for cohort analysis visits for the given cohort definition id and concept id

# Arguments

- `id::Number` - The cohort ID

- `conceptId::Number` - The visit concept iD

- `sourceKey::String` - The source key

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_visit`.
"""
function get_cohortresults_visit(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/visit/{conceptId}"
    args = Dict(
        "id" => id,
        "conceptId" => conceptId,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_evidencesummary(
  query,
  sourceKey::String,
)
```

Originally provided an evidence summary from LAERTES

# Arguments

- `sourceKey::String` - The source key of the CEM daimon

# Returns

- A summary of evidence

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_evidencesummary`.
"""
function get_evidence_evidencesummary(
  query,
  sourceKey::String,
)

    url_stub = "evidence/{sourceKey}/evidencesummary"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_conceptset_version_expression(
  id::Number,
  version::Number,
)
```

Get the concept set expression for a selected version of the expression

# Arguments

- `id::Number` - The concept set ID

- `version::Number` - The version identifier

# Returns

- The concept set expression

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_conceptset_version_expression`.
"""
function get_conceptset_version_expression(
  id::Number,
  version::Number,
)

    url_stub = "conceptset/{id}/version/{version}/expression"
    args = Dict(
        "id" => id,
        "version" => version,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization_generation_result(
  query,
  generationId::Number,
)
```

Get cohort characterization results

# Arguments

- `generationId::Number` - id for generation

# Returns

- The complete set of characterization analyses filtered by the thresholdLevel parameter

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization_generation_result`.
"""
function get_cohortcharacterization_generation_result(
  query,
  generationId::Number,
)

    url_stub = "cohort-characterization/generation/{generationId}/result"
    args = Dict(
        "generationId" => generationId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_pathwayanalysis_generation_result(
  generationId::Number,
)
```

Get the results for the given generation.

# Arguments

- `generationId::Number` - the generation id of the results

# Returns

- the pathway analysis results

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_pathwayanalysis_generation_result`.
"""
function get_pathwayanalysis_generation_result(
  generationId::Number,
)

    url_stub = "pathway-analysis/generation/{generationId}/result"
    args = Dict(
        "generationId" => generationId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_concept(
  id::Number,
)
```

Get a concept based on the concept identifier from the default vocabulary source

# Arguments

- `id::Number` - The concept ID to find

# Returns

- The concept details

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_concept`.
"""
function get_vocabulary_concept(
  id::Number,
)

    url_stub = "vocabulary/concept/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_cohortspecificprocedure(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)
```

Queries for cohort analysis procedure drilldown results for the given cohort definition id and concept id

# Arguments

- `id::Number` - The cohort ID

- `conceptId::Number` - The procedure concept ID

- `sourceKey::String` - The source key

# Returns

- List<ScatterplotRecord>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_cohortspecificprocedure`.
"""
function get_cohortresults_cohortspecificprocedure(
  query,
  id::Number,
  conceptId::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/cohortspecificprocedure/{conceptId}"
    args = Dict(
        "id" => id,
        "conceptId" => conceptId,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_pathwayanalysis(
  body,
)
```

Get a page of pathway analysis designs for list From the selected page, a list of PathwayAnalysisDTOs are returned containing summary information about the analysis (name, id, modified dates, etc) * @param pageable indicates how many elements per page to return, and which page to fetch

# Returns

- the list of pathway analysis DTOs.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_pathwayanalysis`.
"""
function get_pathwayanalysis(
  body,
)

    url_stub = "pathway-analysis/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_saml_slo(
)
```

Log out of the service

# Returns

- Response

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_saml_slo`.
"""
function get_saml_slo(
)

    url_stub = "saml/slo"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortsample(
  query,
  cohortDefinitionId::Number,
  sourceKey::String,
  sampleId::Number,
)
```

Get an existing cohort sample

# Arguments

- `cohortDefinitionId::Number` - 

- `sourceKey::String` - 

- `sampleId::Number` - 

# Returns

- personId, gender, age of each person in the cohort sample

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortsample`.
"""
function get_cohortsample(
  query,
  cohortDefinitionId::Number,
  sourceKey::String,
  sampleId::Number,
)

    url_stub = "cohortsample/{cohortDefinitionId}/{sourceKey}/{sampleId}"
    args = Dict(
        "cohortDefinitionId" => cohortDefinitionId,
        "sourceKey" => sourceKey,
        "sampleId" => sampleId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cdmresults_refreshcache(
  sourceKey::String,
)
```

Refresh the results cache for a selected source

# Arguments

- `sourceKey::String` - The source key

# Returns

- The job execution resource

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cdmresults_refreshcache`.
"""
function get_cdmresults_refreshcache(
  sourceKey::String,
)

    url_stub = "cdmresults/{sourceKey}/refreshCache"
    args = Dict(
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_healthcareutilization_visit(
  query,
  id::Number,
  sourceKey::String,
  window::Enum,
  visitStat::Enum,
)
```

Get the healthcare utilization report by window, visit status, period type, visit concept, visit type concept and cost type concept.

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

- `window::Enum` - The time window

- `visitStat::Enum` - The visit status

# Returns

- HealthcareVisitUtilizationReport

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_healthcareutilization_visit`.
"""
function get_cohortresults_healthcareutilization_visit(
  query,
  id::Number,
  sourceKey::String,
  window::Enum,
  visitStat::Enum,
)

    url_stub = "cohortresults/{sourceKey}/{id}/healthcareutilization/visit/{window}/{visitStat}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
        "window" => window,
        "visitStat" => visitStat,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_person(
  query,
  sourceKey::String,
  personId::String,
)
```

Get the complete medical history for a single person in a single database

# Arguments

- `sourceKey::String` - Data source to extract from

- `personId::String` - Person whose profile to extract

# Returns

- All records in a patient profile with start and end days relative to cohort start date or initial date of observation

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_person`.
"""
function get_person(
  query,
  sourceKey::String,
  personId::String,
)

    url_stub = "{sourceKey}/person/{personId}"
    args = Dict(
        "sourceKey" => sourceKey,
        "personId" => personId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_estimation_copy(
  id::Number,
)
```

Used to create a copy of an existing existing estimation design by ID.

# Arguments

- `id::Number` - The ID of the estimation design

# Returns

- An EstimationDTO which contains the newly copied estimation design.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_estimation_copy`.
"""
function get_estimation_copy(
  id::Number,
)

    url_stub = "estimation/{id}/copy"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortdefinition_generate(
  id::Number,
  sourceKey::String,
)
```

Queues up a generate cohort task for the specified cohort definition id.

# Arguments

- `id::Number` - the Cohort Definition ID to generate

- `sourceKey::String` - The source to execute the cohort generation

# Returns

- the job info for the cohort generation

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortdefinition_generate`.
"""
function get_cohortdefinition_generate(
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortdefinition/{id}/generate/{sourceKey}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_concept_descendants(
  sourceKey::String,
  id::Number,
)
```

Get a collection of descendant concepts for the selected concept identifier using the selected source key

# Arguments

- `sourceKey::String` - The source containing the vocabulary

- `id::Number` - The concept identifier

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_concept_descendants`.
"""
function get_vocabulary_concept_descendants(
  sourceKey::String,
  id::Number,
)

    url_stub = "vocabulary/{sourceKey}/concept/{id}/descendants"
    args = Dict(
        "sourceKey" => sourceKey,
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_search(
  query::String,
)
```

Search for a concept based on a query using the default vocabulary source. NOTE: This method uses the query as part of the URL and not the query string

# Arguments

- `query::String` - The query to use to search for concepts

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_search`.
"""
function get_vocabulary_search(
  query::String,
)

    url_stub = "vocabulary/search/{query}"
    args = Dict(
        "query" => query,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_estimation_download(
  query,
  id::Number,
)
```

Download an R package to execute the estimation study

# Arguments

- `id::Number` - The id for the estimation study

# Returns

- Binary_zip file containing the full R package

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_estimation_download`.
"""
function get_estimation_download(
  query,
  id::Number,
)

    url_stub = "estimation/{id}/download"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_measurement(
  query,
  id::Number,
  sourceKey::String,
)
```

Queries for cohort analysis for measurement treemap

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

# Returns

- List<HierarchicalConceptRecord>

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_measurement`.
"""
function get_cohortresults_measurement(
  query,
  id::Number,
  sourceKey::String,
)

    url_stub = "cohortresults/{sourceKey}/{id}/measurement"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_evidence_labelsearch(
  searchTerm::String,
)
```

<a href="https://github.com/OHDSI/Penelope">PENELOPE</a> function: search the DRUG_LABELS.search_name for the searchTerm

# Arguments

- `searchTerm::String` - The search term

# Returns

- A list of drug labels matching the search term

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_evidence_labelsearch`.
"""
function get_evidence_labelsearch(
  searchTerm::String,
)

    url_stub = "evidence/labelsearch/{searchTerm}"
    args = Dict(
        "searchTerm" => searchTerm,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_source_connection(
  key::String,
)
```

Check source connection. This method attempts to connect to the source by calling 'select 1' on the source connection.

# Arguments

- `key::String` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_source_connection`.
"""
function get_source_connection(
  key::String,
)

    url_stub = "source/connection/{key}"
    args = Dict(
        "key" => key,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_info(
)
```

Get info about the WebAPI instance

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_info`.
"""
function get_info(
)

    url_stub = "info/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_executionservice_execution_status(
  executionId::Number,
)
```

Get the execution status by execution ID

# Arguments

- `executionId::Number` - The execution ID

# Returns

- The status

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_executionservice_execution_status`.
"""
function get_executionservice_execution_status(
  executionId::Number,
)

    url_stub = "executionservice/execution/status/{executionId}"
    args = Dict(
        "executionId" => executionId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_healthcareutilization_periods(
  id::Number,
  sourceKey::String,
  window::Enum,
)
```

Get the healthcare utilization periods

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

- `window::Enum` - The time window

# Returns

- A list of the periods

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_healthcareutilization_periods`.
"""
function get_cohortresults_healthcareutilization_periods(
  id::Number,
  sourceKey::String,
  window::Enum,
)

    url_stub = "cohortresults/{sourceKey}/{id}/healthcareutilization/periods/{window}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
        "window" => window,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_reusable(
  body,
)
```



> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_reusable`.
"""
function get_reusable(
  body,
)

    url_stub = "reusable/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_prediction(
)
```

Used to retrieve all prediction designs in the WebAPI database.

# Returns

- A list of all prediction design names and identifiers

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_prediction`.
"""
function get_prediction(
)

    url_stub = "prediction/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_source_details(
  sourceId::Number,
)
```

Get Source Details Source Details contains connection-specific information like JDBC url and authentication information.

# Arguments

- `sourceId::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_source_details`.
"""
function get_source_details(
  sourceId::Number,
)

    url_stub = "source/details/{sourceId}"
    args = Dict(
        "sourceId" => sourceId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_source_priorityvocabulary(
)
```

Get the priority vocabulary source. WebAPI designates one CDM vocabulary as the priority vocabulary to be used for vocabulary searches in Atlas.

# Returns

- The CDM metadata for the priority vocabulary.

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_source_priorityvocabulary`.
"""
function get_source_priorityvocabulary(
)

    url_stub = "source/priorityVocabulary"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_saml_samlmetadata(
)
```

Get the SAML metadata

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_saml_samlmetadata`.
"""
function get_saml_samlmetadata(
)

    url_stub = "saml/saml-metadata"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortcharacterization_export(
  id::Number,
)
```

Get a cohort characterization definition

# Arguments

- `id::Number` - The id of an existing cohort characterization definition

# Returns

- JSON containing the cohort characterization definition

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortcharacterization_export`.
"""
function get_cohortcharacterization_export(
  id::Number,
)

    url_stub = "cohort-characterization/{id}/export"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_search(
  sourceKey::String,
  query::String,
)
```

Search for a concept based on a query using the selected vocabulary source.

# Arguments

- `sourceKey::String` - The source key holding the OMOP vocabulary

- `query::String` - The query to use to search for concepts

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_search`.
"""
function get_vocabulary_search(
  sourceKey::String,
  query::String,
)

    url_stub = "vocabulary/{sourceKey}/search/{query}"
    args = Dict(
        "sourceKey" => sourceKey,
        "query" => query,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_user_import_job(
  id::Number,
)
```

Get user import job by ID

# Arguments

- `id::Number` - The job ID

# Returns

- The user import job

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_user_import_job`.
"""
function get_user_import_job(
  id::Number,
)

    url_stub = "user/import/job/{id}"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_featureextraction_defaultcovariatesettings(
  query,
)
```

Get default feature extraction settings

# Returns

- JSON with default covariate settings object

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_featureextraction_defaultcovariatesettings`.
"""
function get_featureextraction_defaultcovariatesettings(
  query,
)

    url_stub = "featureextraction/defaultcovariatesettings"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortdefinition(
)
```

Returns metadata about all cohort definitions in the WebAPI database<BR/><STRONG>See Also:</STRONG><BR/><UL> <LI><code>org.ohdsi.webapi.cohortdefinition.CohortMetadataDTO</code></LI> </UL>

# Returns

- List of metadata about all cohort definitions in WebAPI

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortdefinition`.
"""
function get_cohortdefinition(
)

    url_stub = "cohortdefinition/"
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_vocabulary_concept_descendants(
  id::Number,
)
```

Get a collection of descendant concepts for the selected concept identifier using the default vocabulary

# Arguments

- `id::Number` - The concept identifier

# Returns

- A collection of concepts

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_vocabulary_concept_descendants`.
"""
function get_vocabulary_concept_descendants(
  id::Number,
)

    url_stub = "vocabulary/concept/{id}/descendants"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_reusable_exists(
  query,
  id::Number,
)
```



# Arguments

- `id::Number` - 

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_reusable_exists`.
"""
function get_reusable_exists(
  query,
  id::Number,
)

    url_stub = "reusable/{id}/exists"
    args = Dict(
        "id" => id,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_prediction_generation(
  generationId::Number,
)
```

Get a prediction design generation info.

# Arguments

- `generationId::Number` - The id for the prediction generation

# Returns

- ExecutionBasedGenerationDTO The generation information

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_prediction_generation`.
"""
function get_prediction_generation(
  generationId::Number,
)

    url_stub = "prediction/generation/{generationId}"
    args = Dict(
        "generationId" => generationId,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end

"""
```julia
get_cohortresults_healthcareutilization_exposure(
  query,
  id::Number,
  sourceKey::String,
  window::Enum,
)
```

Get the healthcare utilization exposure report for a specific window

# Arguments

- `id::Number` - The cohort ID

- `sourceKey::String` - The source key

- `window::Enum` - The time window

# Returns

- HealthcareExposureReport

> **NOTE:** For more information on what this function returns, access expanded help by running `help>?get_cohortresults_healthcareutilization_exposure`.
"""
function get_cohortresults_healthcareutilization_exposure(
  query,
  id::Number,
  sourceKey::String,
  window::Enum,
)

    url_stub = "cohortresults/{sourceKey}/{id}/healthcareutilization/exposure/{window}"
    args = Dict(
        "id" => id,
        "sourceKey" => sourceKey,
        "window" => window,
    )

    for arg in keys(args)
        url_stub = replace(url_stub, "{" * arg * "}" => args[arg])
    end
    HTTP.get(joinpath(BASE_URL, url_stub))

end


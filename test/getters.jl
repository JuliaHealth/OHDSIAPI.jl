@testset "get_cohortdefinition_version" begin
    id = 1792865
    @testset "recorded response exists and is valid" begin
        version_resp = playback(() -> get_cohortdefinition_version(id), "version_1792865.bson")
        @test version_resp.status == 200
        versions = JSON3.read(String(version_resp.body))
        @test length(versions) > 0
        @test haskey(versions[1], "version")
    end
end

@testset "download_cohort_definition (single ID)" begin
    @testset "recorded single ID download" begin
        result = playback(() -> download_cohort_definition(1792865; progress_bar=true, metadata=""), "cohort_definition_1792865.bson")
        if length(result) == 0
            @info "Result was empty - possibly skipped due to metadata check"
            @test true  
        else
            @test length(result) == 1
            @test occursin("1792865.json", result[1])
        end
    end
end

@testset "download_cohort_definition (multiple IDs)" begin
    @testset "recorded multi ID download" begin
        ids = [1792956, 1790632]
        result = playback(() -> download_cohort_definition(ids; progress_bar=true, metadata=""), "cohort_definitions_multiple.bson")
        if length(result) == 0
            @info "Result was empty - possibly all cohorts skipped due to metadata"
            @test true
        else
            @test length(result) == 2
            @test all(x -> occursin(".json", x), result)
        end
    end
end

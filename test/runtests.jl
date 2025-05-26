using JSON3
using Test
using ReferenceTests
using Base: basename

import OHDSIAPI: 
    get_cohortdefinition_version, 
    download_cohort_definition

import BrokenRecord: 
    configure!,
    playback

configure!(
    path=joinpath(@__DIR__, "fixtures"),
    ignore_headers=["Authorization", "User-Agent"],
)

@testset "OHDSIAPI.jl" begin
  @testset "Getter Functions" begin
		include("getters.jl")
	end
end

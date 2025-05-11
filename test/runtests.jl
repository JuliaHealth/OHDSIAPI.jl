using Test
using OHDSIAPI
using BrokenRecord: configure!

const fixtures_path = joinpath(@__DIR__, "fixtures")
isdir(fixtures_path) || mkdir(fixtures_path)
configure!(; path=fixtures_path)

@testset "OHDSIAPI.jl" begin
  @testset "Getter Functions" begin
		include("getters.jl")
	end
end
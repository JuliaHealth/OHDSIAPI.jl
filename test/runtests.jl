using OHDSIAPI.ATLAS
using Test

@testset "OHDSIAPI.jl" begin
  @testset "Getter Functions" begin
		include("getters.jl")
	end
end

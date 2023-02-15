using OHDSIAPI.ATLAS
using Test

@testset "OHDSIAPI.jl" begin
    # Write your tests here.
    @testset "Getter Functions" begin
		include("getters.jl")
	end
end

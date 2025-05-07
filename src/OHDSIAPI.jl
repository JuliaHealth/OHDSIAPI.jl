module OHDSIAPI

using HTTP 
using JSON3 
using Dates
using ProgressMeter

BASE_URL = "https://atlas-demo.ohdsi.org/WebAPI/"

include("get.jl")
include("utils.jl")

end

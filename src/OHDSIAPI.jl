module OHDSIAPI

using HTTP 
using JSON3 
using Dates
using ProgressMeter

export get_cohort_definition

BASE_URL = "https://atlas-demo.ohdsi.org/WebAPI/"

include("get.jl")
include("utils.jl")

end

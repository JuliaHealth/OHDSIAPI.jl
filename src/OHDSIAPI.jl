module OHDSIAPI

using HTTP 
using JSON3 
using ProgressMeter
using ZipFile

BASE_URL = "https://atlas-demo.ohdsi.org/WebAPI"

include("get.jl")
include("downloaders.jl")

end

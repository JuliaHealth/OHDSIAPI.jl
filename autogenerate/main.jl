using InvertedIndices
using Downloads
using JSON3
using NodeJS

@kwdef struct FUNCTION_DEF 
    func_name::String
    method::String
    description
    url::String
    args
    output
end

@kwdef struct ARGUMENT_DEF
    arg_name::String
    type
    description::String
end

const API_TYPE_DICT = Dict(
    "number" => Number,
    "string" => String,
    "enum" => Enum
)

STATUS_CODES = 
"""
{
   "httpCode": 200,
    "comment": "The service call has completed successfully."
}, {
   "httpCode": 412,
    "comment": "Invalid JSON/XML input."
}, {
   "httpCode": 500,
    "comment": "The service call has not succeeded."
}
"""

url = "http://webapidoc.ohdsi.org/input/input.js"
destination = "data/input.js"
nodejs = nodejs_cmd()

Downloads.download(url, destination)

run(`$nodejs parse_input.js`)

ends = JSON3.read("data/endpoints.json");

http_methods = ["GET", "POST", "DELETE", "PUT"]
ends_dict = Dict(m => [] for m in http_methods)

ends = ends[
    Not(findall(x -> x.title == "DO NOT USE", ends)),
    :
];

for e in ends
    push!(ends_dict[e[:http]], e)
end

func_names = []
for e in ends
    elems = splitpath(replace(e.url, "-" => ""))
    indxs = findall(x -> occursin("{", x), elems)

    front = elems[Not(indxs)][2:end]
    front = join(lowercase.(front), "_")

    # NOTE: Actually, refactor based on this comment: seems to me like most stuff beyond the by clauses would work better as names of arguments / keyword arguments

    back = elems[indxs] .|> x -> replace(x, r"{|}" => "")
    back = join(lowercase.(back), "_")
    push!(
        func_names, 
        lowercase(e.http) * "_" * front * "_by_" * back
    )
end

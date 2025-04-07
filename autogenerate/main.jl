using InvertedIndices
using Downloads
using JSON3
using NodeJS

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

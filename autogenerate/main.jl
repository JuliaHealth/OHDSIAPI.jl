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

ends = ends[
    Not(findall(x -> x.title == "DO NOT USE", ends)),
    :
];

function get_func_name(e) 
    elems = splitpath(replace(e.url, "-" => ""))
    indxs = findall(x -> occursin("{", x), elems)

    front = elems[Not(indxs)][2:end]
    front = join(lowercase.(front), "_")

    return lowercase(e.http) * "_" * front
end

function get_arguments(e)
    args = []
    if isempty(e.inputs.PATH)
        return nothing
    else
        for input in e.inputs.PATH
            type = input.typeValue

            if hasproperty(type, :typeValue)
                type = type.typeValue
            else
                type = type.type
            end

            arg = ARGUMENT_DEF(
                arg_name = input.name,
                type = API_TYPE_DICT[type],
                description = isnothing(input.comment) ? "" : input.comment
            )
            push!(args, arg)
        end

        return args

    end
end

function get_output(e)
    output = []
    if isempty(e.output)
        return nothing
    else
        return e.output
    end

end

funcs = []
for e in ends
    func = FUNCTION_DEF(
        func_name = get_func_name(e),
        method = e.http,
        description = isnothing(e.beschrijving) ? e.title : e.beschrijving,
        url = e.url,
        args = get_arguments(e),
        output = get_output(e)
    )
    push!(funcs, func)
end

for func in funcs
    func_body = """\"\"\""""

    func_header = """\n```julia\n$(func.func_name)("""
    if !isnothing(func.args)
        for arg in func.args
            func_header *= "\n  $(arg.arg_name)::$(arg.type),"
        end
        func_header *= "\n)"
    else
        func_header *= ")"
    end
        
    func_header *= "\n```\n\n"

    func_body *= func_header

    func_body *= func.description

    if !isnothing(func.args)
        func_body *= "\n\n# Arguments"
        for arg in func.args
            arg_body = """"""
            arg_body *= "- `$(arg.arg_name)::$(arg.type)` - $(arg.description)"
            func_body *= "\n\n$(arg_body)"
        end
    end

    if func.method != "DELETE"
        if hasproperty(func.output, :comment) && !isnothing(func.output.comment) && !isempty(func.output.comment)
            func_body *= "\n\n# Returns"
            func_body *= "\n\n- $(func.output.comment)"
        end
    end

    func_body *= "\n\n> **NOTE:** For more information on what this function returns, access expanded help by running `help>?$(func.func_name)`."

    func_body *= """\n\"\"\""""
    func_body *= "\nfunction $(func_header[11:end-6])"
    func_body *= """\n\nend"""

    println(func_body)
    break
end

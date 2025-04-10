using InvertedIndices
using Downloads
using JSON3
using NodeJS

include("constants.jl")
include("download.jl")
include("getters.jl")

ends = JSON3.read("data/endpoints.json");
ends = ends[Not(findall(x -> x.title == "DO NOT USE", ends)), :];

for e in ends
    func = FUNCTION_DEF(
        func_name = get_func_name(e),
        method = e.http,
        description = isnothing(e.beschrijving) ? e.title : e.beschrijving,
        url = e.url,
        args = get_arguments(e),
        queries = get_queries(e),
        output = get_output(e)
    )
    push!(FUNC_DICT[e.http], e)
end

# TODO: Iterate through each method type via keys first
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

    break
end

# TODO: Break out functions by HTTP method types
# TODO: Check POST payload descriptions
# TODO: Add extended help with output information per function
# TODO: Break out functions across files per HTTP method type
# TODO: Create ATLAS submodule where these functions live
# TODO: Export ATLAS submodule 
# TODO: Determine testing suite 

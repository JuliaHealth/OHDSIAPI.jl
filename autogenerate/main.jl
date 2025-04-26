using InvertedIndices
using Downloads
using JSON3
using NodeJS

includet("constants.jl")
includet("download.jl")
includet("function_builders.jl")
includet("getters.jl")

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
        body = get_body(e),
        output = get_output(e)
    )
    push!(FUNC_DICT[e.http], func)
end

# TODO: Iterate through each method type via keys first
for func in FUNC_DICT["GET"]
    docstring = """\"\"\""""
    docstring *= build_header!(docstring, func)
    docstring *= func.description
    docstring = build_arguments!(docstring, func)

    if func.method != "DELETE"
        if hasproperty(func.output, :comment) && !isnothing(func.output.comment) && !isempty(func.output.comment)
            docstring *= "\n\n# Returns"
            docstring *= "\n\n- $(func.output.comment)"
        end
    end

    docstring = build_footer!(docstring, func)
    func_code = """\n\n"""
    func = build_code!(func_code, func)
    
    push!(GENERATED_FUNCTIONS["GET"], 
        GENERATED_FUNCTION(
            docstring,
            func
        )
    )
end

    break
end


# TODO: Write some routine to check for duplicated function names
# TODO: Figure out how to handle duplicated function names
# TODO: Check POST payload descriptions
# TODO: Add extended help with output information per function
# TODO: Create ATLAS submodule where these functions live
# TODO: Export ATLAS submodule 
# TODO: Determine testing suite 

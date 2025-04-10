@kwdef struct FUNCTION_DEF 
    func_name::String
    method::String
    description
    url::String
    args
    queries
    output
end

@kwdef struct ARGUMENT_DEF
    arg_name::String
    type
    description::String
end

@kwdef struct QUERY_DEF
    query_name::String
    type
    description::String
end

const API_TYPE_DICT = Dict(
    "number" => Number,
    "string" => String,
    "enum" => Enum,
    "boolean" => Bool
)

const HTTP_METHODS = ["GET", "POST", "DELETE", "PUT"]
const FUNC_DICT = Dict(m => [] for m in HTTP_METHODS)

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

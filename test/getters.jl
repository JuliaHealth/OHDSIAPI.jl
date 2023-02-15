import JSON 
import JSON3

@testset "get_concept_name tests" begin

    #test that json data without concept name returns "NA"
    dict1 = Dict("param1" => 1, "param2" => 2, "dict" => Dict("d1"=>1.,"d2"=>1.,"d3"=>1.))
    json_invalid = JSON.json(dict1)
    concept_name_invalid = get_concept_name(json_invalid)
    @test concept_name_invalid == "NA"

    #test for json data with concept name
    json_valid = """{"items": {"1":{"concept": {"CONCEPT_ID":8507,"CONCEPT_NAME":"MALE","STANDARD_CONCEPT":"S","STANDARD_CONCEPT_CAPTION":"Standard","INVALID_REASON":"V","INVALID_REASON_CAPTION":"Valid","CONCEPT_CODE":"M","DOMAIN_ID":"Gender","VOCABULARY_ID":"Gender","CONCEPT_CLASS_ID":"Gender","VALID_START_DATE":0,"VALID_END_DATE":4102358400000}}}}"""
    content = JSON3.read(json_valid)
    valid_item = content.items[1]
    @test get_concept_name(json_valid) == valid_item["concept"]["CONCEPT_NAME"]
    @test get_concept_name(json_valid) == "MALE"
    #JSON3.pretty(valid_item)

end

@testset "get_atlas_concept tests" begin

    #test if function accepts string id 
    string_id = "8507"
    @test (get_atlas_concept(string_id) != "NA")

    #test if function accepts int id 

    int_id = 8507
    @test (get_atlas_concept(int_id) != "NA")

end

json.extract!(problem,
	:id,
	:title,
	:background_info,
	:description,
	:input_description,
	:output_description,
	:example_input,
	:example_output,
)

json.test_input problem.test_input.download
json.expected_output problem.expected_output.download

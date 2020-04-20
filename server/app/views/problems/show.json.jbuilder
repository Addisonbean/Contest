json.problem do
	json.partial! @problem

	if @current_user&.admin?
		json.test_input @problem.test_input.download
		json.expected_output @problem.expected_output.download
	end
end

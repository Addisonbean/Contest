json.attempts @attempts do |a|
	json.extract! a, :id, :status, :created_at

	json.problem do
		json.extract! a.problem, :id, :title
	end
end

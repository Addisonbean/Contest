json.attempts @attempts do |a|
	json.extract! a, :id, :status

	json.user do
		json.extract! a.user, :id, :username
	end
	json.problem do
		json.extract! a.problem, :id, :title
	end
end

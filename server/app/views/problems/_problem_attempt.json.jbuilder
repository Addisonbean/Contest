json.extract! problem, :id, :title
json.attempts do
	json.array! problem.attempts.where(contest: contest) do |a|
		json.extract! a, :id, :status
		json.user do
			json.extract! a.user, :id, :username
		end
	end
end

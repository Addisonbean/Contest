json.problems do
	json.array! @contest.problems, partial: 'problems/problem_attempt', as: :problem, locals: { contest: @contest }
end

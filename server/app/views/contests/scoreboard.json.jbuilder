json.scoreboard do
	# TODO: don't return all users, only the ones in this contest
	json.users User.contestants do |u|
		json.username u.username
		json.id u.id

		total_minutes_spent = 0
		total_attempts = 0
		total_solved = 0

		json.problem_standings @contest.problems do |p|
			attempts = Attempt.where(user: u, problem: p, contest: @contest)
			mins = attempts.map(&:minutes_since_contest_start).sum
			solved = attempts.any? { |a| a.accepted? }

			total_minutes_spent += mins
			total_attempts += attempts.size
			total_solved += 1 if solved

			json.total_attempts attempts.size
			json.total_minutes mins
			json.solved solved
			json.problem_id p.id
			json.problem_title p.title
		end
		json.standing do
			json.total_minutes total_minutes_spent
			json.total_solved total_solved
			json.total_attempts total_attempts
		end
	end
	json.problems @contest.problems do |p|
		json.title p.title
		json.id p.id
	end
end

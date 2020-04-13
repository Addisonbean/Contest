json.scoreboard do
	# TODO: don't return all users, only the ones in this contest
	json.users User.contestants do |u|
		json.username u.username
		json.id u.id
		json.problem_standings @contest.problems do |p|
			attempts = Attempt.where(user: u, problem: p, contest: @contest)

			json.toal_attempts attempts.size
			json.total_minutes attempts.map(&:minutes_since_contest_start).sum
			json.solved attempts.any? { |a| a.accepted? }

			json.problem_id p.id
			json.problem_title p.title
		end
	end
	json.problems @contest.problems do |p|
		json.title p.title
		json.id p.id
	end
end

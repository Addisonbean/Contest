module ContestHelper
	def current_contest
		@contest ||= Contest.find_by_active(true)
	end
end

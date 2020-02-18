class ContestsController < ApplicationController
	
	# TODO: require admin priv
	def create
		@contest = Contest.new(contest_params)
		try_save(@contest)
	end

	def show_current_contest
		@contest = Contest.find_by_active(true)
		try_show(@contest)
	end

	private

	def contest_params
		params.require(:contest).permit(:title, :start_time, :end_time, :active)
	end

end

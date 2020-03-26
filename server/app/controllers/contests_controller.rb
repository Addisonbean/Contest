class ContestsController < ApplicationController
	before_action :authenticate_admin, only: [:create]
	
	def create
		@contest = Contest.new(contest_params)
		try_save(@contest)
	end

	def show_current_contest
		@contest = current_contest
		try_show(@contest)
	end

	def problems_for_current_contest
		if assert_not_nil(current_contest)
			@contest = current_contest
			render 'contest_problems'
		end
	end

	private

	def contest_params
		params.require(:contest).permit(:title, :start_time, :end_time, :active)
	end

end

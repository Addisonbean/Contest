class ContestsController < ApplicationController
	before_action :authenticate_admin, only: [:create, :update]
	
	def create
		@contest = Contest.new(contest_params)
		try_save(@contest)
	end

	def show
		@contest = Contest.find_by_id(params[:id])
		try_show(@contest)
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

	def scoreboard
		@contest = current_contest
		return if assert_not_nil(@contest)
	end

	def update
		@contest = Contest.find_by_id(params[:contest][:id])
		return unless assert_not_nil(@contest)

		render 'show' if try_update(@contest, contest_params)
	end

	private

	def contest_params
		params.require(:contest).permit(:title, :start_time, :end_time, :active)
	end

end

class ProblemsController < ApplicationController
	before_action :authenticate_admin, only: [:create]

	def create
		@problem = Problem.new(problem_params)

		# TODO: save at the end of this function instead of here
		return unless try_save(@problem)

		if params[:add_to_current_contest]
			if current_contest
				current_contest.problems << @problem
			else
				@msg = 'no current contest'
				render 'shared/error'
			end
		end
	end

	def show
		@problem = Problem.find_by_title_or_id(URI.decode(params[:id]))
		try_show(@problem)
	end

	private

	def problem_params
		params
			.require(:problem)
			.permit(
				:title,
				:description,
				:background_info,
				:input_description,
				:output_description,
				:example_input,
				:example_output,
				:test_input,
				:expected_output,
			)
	end
end

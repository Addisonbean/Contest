class ProblemsController < ApplicationController
	before_action :authenticate_admin, only: [:create]

	def create
		@problem = Problem.new(problem_params)
		try_save(@problem)
	end

	def show
		if /\A\d+\z/ === params[:id]
			@problem = Problem.find_by_id(params[:id])
		else
			title = URI.decode(params[:id])
			@problem = Problem.find_by_title(title)
		end
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

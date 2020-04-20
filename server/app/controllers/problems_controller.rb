require 'securerandom'

class ProblemsController < ApplicationController
	before_action :authenticate_admin, only: [:create]

	def create
		@problem = Problem.new(problem_params)

		input_data = params[:problem][:test_input]
		input_file = ActiveStorage::Blob.build_after_upload(
			io: StringIO.new(input_data),
			filename: SecureRandom.uuid,
		)
		@problem.test_input.attach(input_file)

		output_data = params[:problem][:expected_output]
		output_file = ActiveStorage::Blob.build_after_upload(
			io: StringIO.new(output_data),
			filename: SecureRandom.uuid,
		)
		@problem.expected_output.attach(output_file)

		# TODO: save at the end of this function instead of here
		return unless try_save(@problem)

		input_file.save!
		output_file.save!

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
		@current_user = current_user
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
			)
	end
end

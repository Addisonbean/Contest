require 'securerandom'

class ProblemsController < ApplicationController
	before_action :authenticate_admin, only: [:create, :edit]

	def create
		@problem = Problem.new(problem_params)

		input_data = params[:problem][:test_input]
		input_file = make_blob_for_filedata(input_data)
		@problem.test_input.attach(input_file)

		output_data = params[:problem][:expected_output]
		output_file = make_blob_for_filedata(output_data)
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

	def edit
		@problem = Problem.find_by_title_or_id(URI.decode(params[:id]))
		# @problem.update!(problem_params)
		@problem.update!(
			title: params[:problem][:title],
			description: params[:problem][:description],
			background_info: params[:problem][:background_info],
			input_description: params[:problem][:input_description],
			output_description: params[:problem][:output_description],
			example_input: params[:problem][:example_input],
			example_output: params[:problem][:example_output],
		)

		@problem.test_input.purge_later
		input = make_blob_for_filedata(params[:problem][:test_input])
		@problem.test_input.attach(input)

		@problem.expected_output.purge_later
		output = make_blob_for_filedata(params[:problem][:expected_output])
		@problem.expected_output.attach(output)

		input.save!
		output.save!

		render json: { success: true }
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

	def make_blob_for_filedata(data)
		ActiveStorage::Blob.build_after_upload(
			io: StringIO.new(data),
			filename: SecureRandom.uuid,
		)
	end
end

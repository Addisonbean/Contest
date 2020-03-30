require 'base64'

class AttemptsController < ApplicationController
	before_action :authenticate_user, only: [:create]

	def create
		# TODO: require params[:attempt][:file] to not be nil

		@attempt = current_user.attempts.new(
			problem_id: params[:attempt][:problem_id],
			contest: current_contest,
			language: params[:attempt][:language],
		)

		if !current_contest.problems.include?(@attempt.problem)
			@msg = 'problem is not in current contest'
			render 'shared/error'
			return
		end

		filedata = Base64.decode64(params[:attempt][:file][:contents])
		file = ActiveStorage::Blob.build_after_upload(
			io: StringIO.new(filedata),
			filename: params[:attempt][:file][:filename],
		)

		@attempt.file.attach(file)

		if try_save(@attempt)
			file.save!

			@attempt.delay.execute
		end
	end

end

require 'base64'

class AttemptsController < ApplicationController
	before_action :authenticate_user, only: [:create, :my_attempts]
	before_action :authenticate_admin, only: [:grade, :all_for_current_contest]

	def create
		# TODO: require params[:attempt][:file] to not be nil

		@attempt = current_user.attempts.new(
			problem_id: params[:attempt][:problem_id],
			contest: current_contest,
			language: params[:attempt][:language],
			status: :pending,
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

	def grade
		new_status = params[:attempt][:status]
		# TODO: verify it's either "accepted" or "wrong_answer"

		@attempt = Attempt.find_by_id(params[:attempt][:id])
		return unless assert_not_nil(@attempt)

		@attempt.update(status: new_status)

		render json: {}
	end

	def show
		@attempt = Attempt.find_by_id(params[:id])
		if current_user&.admin? || @attempt.user.id == current_user&.id
			try_show(@attempt)
		else
			@msg = 'Unauthorized'
			render 'shared/error', status: :unauthorized
		end
	end

	def all_for_current_contest
		assert_not_nil(current_contest)

		@attempts = current_contest.attempts
	end

	def my_attempts
		@attempts = Attempt.where(user: current_user, contest: current_contest)
	end
end

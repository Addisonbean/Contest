class UsersController < ApplicationController
	before_action :authenticate_user, only: [:show_current_user]
	before_action :authenticate_admin, only: [:create]

	def create
		@user = User.new(user_params)
		try_save(@user)
	end

	def login
		@user = User.find_by_username(params[:user][:username])
		if @user&.authenticate(params[:user][:password])
			@auth_token = @user.auth_token
		else
			@msg = 'Invalid username or password'
			render 'shared/error', status: :unauthorized
		end
	end

	def show_current_user
		@user = current_user
		render 'show'
	end

	private

	def user_params
		params.require(:user).permit(:username, :password)
	end
end

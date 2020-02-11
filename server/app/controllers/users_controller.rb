class UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		try_save(@user)
	end

	def login
		user = User.find_by_username(params[:user][:username])
		if user&.authenticate(params[:user][:password])
			@auth_token = user.auth_token
		else
			@msg = 'Invalid username or password'
			render 'shared/error', status: :unauthorized
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :password)
	end
end

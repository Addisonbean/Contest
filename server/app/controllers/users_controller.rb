class UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		try_save(@user)
	end

	private

	def user_params
		params.require(:user).permit(:username, :password)
	end
end

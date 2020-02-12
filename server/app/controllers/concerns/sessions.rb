module Sessions

	def current_user
		token = request.headers['Authorization']
		if token.present?
			@current_user ||= User.find_by_auth_token(token)
		end
	end

	def authenticate_user
		if current_user.nil?
			@msg = "Unauthorized"
			render 'shared/error', status: :unauthorized
			return
		end
	end

end

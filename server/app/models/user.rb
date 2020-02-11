class User < ApplicationRecord
	has_secure_password

	has_secure_token :auth_token

	validates :username, presence: true, uniqueness: true
end

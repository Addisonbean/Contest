class Attempt < ApplicationRecord
	belongs_to :user
	belongs_to :problem
	belongs_to :contest

	enum status: [:pending, :accepted, :wrong_answer, :runtime_error, :compilation_error]
end

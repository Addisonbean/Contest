class Contest < ApplicationRecord
	has_and_belongs_to_many :problems

	validates :title, presence: true, uniqueness: true
	validates :start_time, presence: true
	validates :end_time, presence: true
end

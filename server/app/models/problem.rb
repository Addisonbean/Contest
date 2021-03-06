class Problem < ApplicationRecord
	has_and_belongs_to_many :contests
	has_many :attempts

	validates :title, presence: true, uniqueness: true
	validates :description, presence: true
	validates :input_description, presence: true
	validates :output_description, presence: true
	validates :example_input, presence: true
	validates :example_output, presence: true

	has_one_attached :test_input
	has_one_attached :expected_output

	def self.find_by_title_or_id(id)
		if /\A\d+\z/ === id
			Problem.find_by_id(id)
		else
			Problem.find_by_title(id)
		end
	end
end

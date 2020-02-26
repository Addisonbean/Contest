class Problem < ApplicationRecord
	has_and_belongs_to_many :contests

	validates :title, presence: true, uniqueness: true
	validates :description, presence: true
	validates :input_description, presence: true
	validates :output_description, presence: true
	validates :example_input, presence: true
	validates :example_output, presence: true
	validates :test_input, presence: true
	validates :expected_output, presence: true
end

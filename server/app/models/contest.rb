class Contest < ApplicationRecord
	validates :title, presence: true, uniqueness: true
end

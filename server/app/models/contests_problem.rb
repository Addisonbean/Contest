class ContestsProblem < ApplicationRecord
  belongs_to :contest
  belongs_to :problem
end

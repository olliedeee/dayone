class GoalCategory < ApplicationRecord
  belongs_to :category
  belongs_to :goal
end
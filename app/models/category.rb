class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25}
  validates_uniqueness_of :name
  has_many :goal_categories
  has_many :goals, through: :goal_categories
end

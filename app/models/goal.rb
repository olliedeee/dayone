class Goal < ApplicationRecord
  
  belongs_to :user
  has_many :goal_categories
  has_many :categories, through: :goal_categories
  has_many :comments, dependent: :destroy



  validates :name, presence:true, length: {minimum: 4, maximum: 240}
  validates :description, presence:true, length: {minimum: 4, maximum: 500}
  validates :user_id, presence:true
  default_scope -> { order(updated_at: :desc) }


end
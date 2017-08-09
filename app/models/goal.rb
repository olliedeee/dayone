class Goal < ApplicationRecord
  
  
  validates :name, presence:true, length: {minimum: 4, maximum: 240}
  validates :description, presence:true, length: {minimum: 4, maximum: 500}
  validates :user_id, presence:true
  belongs_to :user

end
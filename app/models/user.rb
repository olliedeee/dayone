class User < ApplicationRecord
  
  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }
  has_many :goals

  validates :username, presence:true, length: {minimum: 2, maximum: 30}, uniqueness: {case_sensitive:false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, length: {maximum: 130}, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive:false}


end
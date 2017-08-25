class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  
  enum role: [:user, :editor, :moderator, :admin]
  
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role ||= :user
  end
  
  
  
  
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  before_save { self.email = email.downcase }
  # before_save { self.username = username.downcase }
  has_many :goals, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  mount_uploader :profileimage, ImageUploader





  validates :password, presence:true, length: {minimum: 5, maximum: 120}, allow_nil: true
  # validates :username, presence:true, length: {minimum: 2, maximum: 30}, uniqueness: {case_sensitive:false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, length: {maximum: 130}, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive:false}
                    


end
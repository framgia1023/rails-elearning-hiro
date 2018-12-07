class User < ApplicationRecord
  validates :name, presence:true, length: { maximum:25, minimum:2 }

  before_save { email.downcase! }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum:50 },
                                   format: { with: EMAIL_REGEX },
                                   uniqueness: { case_sensitive:false }
  has_secure_password
  validates :password, length: { minimum:6 }, allow_nil: true
  
end

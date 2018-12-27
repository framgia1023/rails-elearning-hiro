class User < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :categories, through: :lessons
  has_many :activities
  has_many :words, through: :lessons
  

  validates :name, presence:true, length: { maximum:25, minimum:2 }

  before_save { email.downcase! }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum:50 },
                                    format: { with: EMAIL_REGEX },
                                    uniqueness: { case_sensitive:false }
  has_secure_password
  validates :password, length: { minimum:6 }, allow_nil: true
  
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy

  has_many :followers, through: :passive_relationships, source: :follower

  mount_uploader :picture, PictureUploader

  validate :picture_size
 
  def picture_size
    if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
    end
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all 
    end
  end
  
end


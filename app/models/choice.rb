class Choice < ApplicationRecord
  belongs_to :word
  validates :choice, presence: true  
  has_many :answers, dependent: :destroy
  has_many :lessons, through: :answers
end

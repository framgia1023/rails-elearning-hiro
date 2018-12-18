class Lesson < ApplicationRecord
	belongs_to :category
	belongs_to :user
	has_many :answers, dependent: :destroy
	has_many :words, through: :answers

def next_word
  (category.words - words).first
end

end

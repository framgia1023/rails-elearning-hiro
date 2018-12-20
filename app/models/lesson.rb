class Lesson < ApplicationRecord
	belongs_to :category
	belongs_to :user
	has_many :answers, dependent: :destroy
	has_many :words, through: :answers
	has_many :choices, through: :answers

	has_one :activity, as: :action, dependent: :destroy

	def next_word
		(category.words - words).first
	end

end

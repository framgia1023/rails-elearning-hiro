class Word < ApplicationRecord
    belongs_to :category

    has_many :choices, dependent: :destroy
    accepts_nested_attributes_for :choices, allow_destroy: true

    validates :word, presence: true 
    
    validate :correct_validation
    
    def correct_validation
        correct = choices.collect do |c|
            c.correct || nil
        end
        if correct.compact.size > 1
            errors.add(:correct, "should be only 1")
        elsif correct.compact.size < 1
            errors.add(:correct, "can't be blank")
        end
    end

    def correct_choice
        choices.find_by(correct: true)
    end

end

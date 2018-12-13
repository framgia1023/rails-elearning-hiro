class Word < ApplicationRecord
    belongs_to :category

    has_many :choices
    accepts_nested_attributes_for :choices

    validates :word, presence: true 
    
    
    validate :correct_validation
    
    def correct_validation
        correct = choices.collect do |c|
            c.correct
        end
        if correct.compact.size > 1
            errors.add(:correct, "only 1 correct is allowed")
        elsif correct.compact.size < 1
            errors.add(:correct, "please select a correct")
        end
    end

end

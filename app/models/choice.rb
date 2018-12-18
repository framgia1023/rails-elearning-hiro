class Choice < ApplicationRecord
    belongs_to :word
    has_many :choices, dependent: :destroy
    validates :choice, presence: true  
end

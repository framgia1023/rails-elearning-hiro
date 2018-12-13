class Category < ApplicationRecord
    has_many :words

    validates :title, presence: true
    validates :description, presence: true  
      
end

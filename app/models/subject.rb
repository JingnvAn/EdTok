class Subject < ApplicationRecord
    has_many :tags 
    has_many :videos, through: :tags
end

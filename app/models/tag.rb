class Tag < ApplicationRecord
    belongs_to :video 
    belongs_to :subject 
end

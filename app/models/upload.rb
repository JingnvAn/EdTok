class Upload < ApplicationRecord
    belongs_to :user
    belongs_to :video
end

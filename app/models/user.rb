class User < ApplicationRecord
    has_many :uploads
    has_many :videos, through: :uploads
end

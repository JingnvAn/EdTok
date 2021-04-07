class User < ApplicationRecord
    before_save { self.email = email.downcase }

    has_many :uploads
    has_many :videos, through: :uploads

    has_many :follows 

    has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
    has_many :followers, through: :follower_relationships, source: :follower 

    has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
    has_many :following, through: :following_relationships, source: :following

    validates :name, presence: true, length: { maximum: 50 }
    validates :username, presence: true, length: { maximum: 50 }
    validates :bio, presence: true, length: { maximum: 255 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end

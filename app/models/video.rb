class Video < ApplicationRecord

    has_many :tags
    has_many :subjects, through: :tags

    has_many :reactions
    has_many :likes, through: :reactions

    has_many :responses
    has_many :comments, through: :responses

    mount_uploader :file, VideoUploader
end

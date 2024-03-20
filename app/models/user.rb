class User < ApplicationRecord
    has_secure_password
    has_one_attached :profile_picture
    has_one_attached :profile_video
    has_many_attached :profile_songs
    has_one :setting, dependent: :destroy
end

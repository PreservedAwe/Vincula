class Setting < ApplicationRecord
    belongs_to :user
    has_many :chosen_tags, dependent: :destroy
    has_many :chosen_genres, dependent: :destroy
    has_many :chosen_artists, dependent: :destroy
end

class User < ApplicationRecord
    has_secure_password
    has_one_attached :profile_picture
    has_one_attached :profile_video
    has_many_attached :profile_songs
    has_one :setting, dependent: :destroy
    has_many :rooms
    has_many :messages
    has_many :chosen_artists, dependent: :destroy, autosave: true
    has_many :chosen_genres, dependent: :destroy, autosave: true
    has_one :chosen_tag, dependent: :destroy, autosave: true
    
    scope :nearby, -> (other_user, current_user) do
        where("(id = ? AND ? <= ?)",
        other_user.id, distance_from(other_user, current_user), current_user.settings.max_distance)
    end    

    def distance_from(other_user, current_user)
        Geocoder::Calculations.distance_between(
            Geocoder.search(current_user.ip_address).first.coordinates,
            Geocoder.search(other_user.ip_address).first.coordinates,
          units: :km
        )
     end    
end

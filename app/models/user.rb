class User < ApplicationRecord
    has_secure_password
    has_one_attached :profile_picture
    has_one_attached :profile_video
    has_many_attached :profile_songs
    has_one :setting, dependent: :destroy
    has_many :rooms
    has_many :messages
    has_many :chosen_artists
    has_many :chosen_genres
    has_many :chosen_tags
    
    scope :nearby, -> (other_user, current_user) do
        where("(id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)",
        other_user.id, current_user.id, recipient_id, sender_id)
    end    

    def distance_from(other_user, current_user)
        Geocoder::Calculations.distance_between(
            Geocoder.search(current_user.ip_address).first.coordinates,
            Geocoder.search(other_user.ip_address).first.coordinates,
          units: :km
        )
     end    
end

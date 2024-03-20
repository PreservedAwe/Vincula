# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Real User data sample

# Seed users
user1 = User.create!(email: 'user1@ex.com', password: 'password1', username: 'taestyy11', latitude: 48.856614, longitude: 2.3522219)
user2 = User.create!(email: 'user2@ex.com', password: 'password2', username: 'taestyy40222')
user1.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')

# Seed settings
user1Settings = user1.create_setting(min_distance: 4, max_distance: 36, user: user1)   
user2Settings = user2.create_setting(min_distance: 9, max_distance: 15, user: user2)  


# Seed genres
user1genre1 = ChosenGenre.create!(genre_id: RSpotify::Category.find('metal').id, user_id: user1.id)


# Path to the video file guide help
#video_path = Rails.root.join('db/videos/example_video.mp4')

# Attach the video to the post
#post.videos.attach(io: File.open(video_path), filename: 'example_video.mp4', content_type: 'video/mp4')


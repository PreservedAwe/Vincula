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
user1 = User.create!(email: 'user1@ex.com', password: 'password1', username: 'taestyy11', ip_address: "173.242.180.229")
user2 = User.create!(email: 'user2@ex.com', password: 'password2', username: 'taestyy40222', ip_address: "192.206.151.131")
user1.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')
user2.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')

# Seed settings
user1Settings = user1.create_setting(max_distance: 36, user: user1)   
user2Settings = user2.create_setting(max_distance: 15, user: user2)  


# Seed all genres
genres = [
 { name: 'Heavy Metal' },
 { name: 'Rock' },
 { name: 'Pop' },
 { name: 'Jazz' },
 { name: 'Classical' },
 { name: 'Electronic' },
 { name: 'Hip Hop' },
 { name: 'Folk' },
 { name: 'Country' },
 { name: 'Blues' },
 { name: 'Punk' },
 { name: 'Reggae' },
 { name: 'Soul' },
 { name: 'Funk' },
 { name: 'R&B' },
 { name: 'Hip-Hop' },
 { name: 'Techno' },
 { name: 'Trance' },
 { name: 'Dubstep' },
 { name: 'Glitch' }
]

Genre.create!(genres)

# Seed all tags
tags = [
 { name: 'Guitarist' },
 { name: 'Pianist' },
 { name: 'Producer' },
 { name: 'Drummer' },
 { name: 'Vocalist' },
 { name: 'Songwriter' },
 { name: 'Mixing Engineer' },
 { name: 'Mastering Engineer' },
 { name: 'Sound Designer' },
 { name: 'Music Director' },
 { name: 'Bassist' },
 { name: 'Keyboardist' },
 { name: 'DJ' },
 { name: 'Violinist' },
 { name: 'Cellist' },
 { name: 'Saxophonist' },
 { name: 'Trumpeter' },
 { name: 'Trombonist' },
 { name: 'Percussionist' },
 { name: 'Conductor' }
]

Tag.create!(tags)

# Path to the video file guide help
#video_path = Rails.root.join('db/videos/example_video.mp4')

# Attach the video to the post
#post.videos.attach(io: File.open(video_path), filename: 'example_video.mp4', content_type: 'video/mp4')


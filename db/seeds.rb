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
 { name: 'Glitch' },
 { name: 'Indie' },
 { name: 'Alternative' },
 { name: 'Metalcore' },
 { name: 'Post-rock' },
 { name: 'Experimental' },
 { name: 'Ambient' },
 { name: 'EDM' },
 { name: 'House' },
 { name: 'Trap' },
 { name: 'Grime' },
 { name: 'Ska' },
 { name: 'Gospel' },
 { name: 'Bluegrass' },
 { name: 'World' },
 { name: 'Electroswing' },
 { name: 'Chillout' },
 { name: 'Trip Hop' },
 { name: 'Acid Jazz' },
 { name: 'Ambient House' },
 { name: 'Industrial' },
 { name: 'Noise' },
 { name: 'Gothic' },
 { name: 'Industrial Metal' },
 { name: 'Death Metal' },
 { name: 'Thrash Metal' },
 { name: 'Progressive Metal' },
 { name: 'Symphonic Metal' },
 { name: 'Power Metal' },
 { name: 'Doom Metal' },
 { name: 'Grunge' },
 { name: 'Post-punk' },
 { name: 'New Wave' },
 { name: 'Psychedelic' },
 { name: 'Space Rock' },
 { name: 'Stoner Rock' },
 { name: 'Glam Rock' },
 { name: 'Progressive Rock' } 
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
 { name: 'Conductor' },
 { name: 'Singer' },
 { name: 'Composer' },
 { name: 'Lyricist' },
 { name: 'Arranger' },
 { name: 'Backing Vocalist' },
 { name: 'Session Musician' },
 { name: 'Live Performer' },
 { name: 'Music Producer' },
 { name: 'Recording Engineer' },
 { name: 'Audio Technician' },
 { name: 'Music Therapist' },
 { name: 'Music Educator' },
 { name: 'Orchestra Member' },
 { name: 'Band Member' },
 { name: 'Soloist' },
 { name: 'Backup Musician' },
 { name: 'Music Critic' },
 { name: 'Music Agent' },
 { name: 'Music Lawyer' },
 { name: 'Music Manager' } 
]

Tag.create!(tags)

# Seed all search types
search_types = [
 { name: 'Artist' },
 { name: 'Genre' },
 { name: 'Tag' }
]

SearchType.create!(search_types)

# Seed users
user1 = User.create!(email: 'user1@example.com', password: 'password1', username: 'u_owe_me_soda', ip_address: "173.242.180.229")
user2 = User.create!(email: 'user2@example.com', password: 'password2', username: 'tangerony', ip_address: "192.206.151.131")
user3 = User.create!(email: 'user3@example.com', password: 'password3', username: 'user3_awesome', ip_address: "192.206.151.132")
user4 = User.create!(email: 'user4@example.com', password: 'password4', username: 'rockstar22', ip_address: "192.206.151.133")
user5 = User.create!(email: 'user5@example.com', password: 'password5', username: 'musiclover555', ip_address: "192.206.151.134")
user6 = User.create!(email: 'user6@example.com', password: 'password6', username: 'beatsmaker77', ip_address: "192.206.151.135")
user7 = User.create!(email: 'user7@example.com', password: 'password7', username: 'rhythm_master', ip_address: "192.206.151.136")
user8 = User.create!(email: 'user8@example.com', password: 'password8', username: 'groovy_cat', ip_address: "192.206.151.137")
user9 = User.create!(email: 'user9@example.com', password: 'password9', username: 'melody_maker', ip_address: "192.206.151.138")
user10 = User.create!(email: 'user10@example.com', password: 'password10', username: 'harmony_lover', ip_address: "192.206.151.139")
user1.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')
user2.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')
user3.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')
user4.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')
user5.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')
user6.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')
user7.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')
user8.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')
user9.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')
user10.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')

# Seed settings
user1Settings = user1.create_setting(max_distance: 36, user: user1, is_enabled: true, genre_id: 1, search_type: 1)   
user2Settings = user2.create_setting(max_distance: 78, user: user2, is_enabled: false, genre_id: 1, search_type: 2)  
user3Settings = user3.create_setting(max_distance: 42, user: user3, is_enabled: true, tag_id: 17, search_type: 2)
user4Settings = user4.create_setting(max_distance: 87, user: user4, is_enabled: false, genre_id: 4, search_type: 1)
user5Settings = user5.create_setting(max_distance: 15, user: user5, is_enabled: true, tag_id: 12, search_type: 3)
user6Settings = user6.create_setting(max_distance: 29, user: user6, is_enabled: false, genre_id: 8, search_type: 2)
user7Settings = user7.create_setting(max_distance: 63, user: user7, is_enabled: true, tag_id: 19, search_type: 1)
user8Settings = user8.create_setting(max_distance: 50, user: user8, is_enabled: false, genre_id: 3, search_type: 3)
user9Settings = user9.create_setting(max_distance: 72, user: user9, is_enabled: true, tag_id: 14, search_type: 2)
user10Settings = user10.create_setting(max_distance: 87, user: user10, is_enabled: false, genre_id: 4, search_type: 1)

chosen_artists = [
    { user: user1, order: 1 },
    { user: user1, order: 2 },
    { user: user1, order: 3 },
    { user: user2, order: 1 },
    { user: user2, order: 2 },
    { user: user2, order: 3 },
    { user: user3, order: 1 },
    { user: user3, order: 2 },
    { user: user3, order: 3 },
    { user: user4, order: 1 },
    { user: user4, order: 2 },
    { user: user4, order: 3 },
    { user: user5, order: 1 },
    { user: user5, order: 2 },
    { user: user5, order: 3 },
    { user: user6, order: 1 },
    { user: user6, order: 2 },
    { user: user6, order: 3 },
    { user: user7, order: 1 },
    { user: user7, order: 2 },
    { user: user7, order: 3 },
    { user: user8, order: 1 },
    { user: user8, order: 2 },
    { user: user8, order: 3 },
    { user: user9, order: 1 },
    { user: user9, order: 2 },
    { user: user9, order: 3 },
    { user: user10, order: 1 },
    { user: user10, order: 2 },
    { user: user10, order: 3 }
  ]
  chosen_artists = ChosenArtist.create!(chosen_artists) 

  chosen_genres = [
    { user: user1, order: 1 },
    { user: user1, order: 2 },
    { user: user1, order: 3 },
    { user: user2, order: 1 },
    { user: user2, order: 2 },
    { user: user2, order: 3 },
    { user: user3, order: 1 },
    { user: user3, order: 2 },
    { user: user3, order: 3 },
    { user: user4, order: 1 },
    { user: user4, order: 2 },
    { user: user4, order: 3 },
    { user: user5, order: 1 },
    { user: user5, order: 2 },
    { user: user5, order: 3 },
    { user: user6, order: 1 },
    { user: user6, order: 2 },
    { user: user6, order: 3 },
    { user: user7, order: 1 },
    { user: user7, order: 2 },
    { user: user7, order: 3 },
    { user: user8, order: 1 },
    { user: user8, order: 2 },
    { user: user8, order: 3 },
    { user: user9, order: 1 },
    { user: user9, order: 2 },
    { user: user9, order: 3 },
    { user: user10, order: 1 },
    { user: user10, order: 2 },
    { user: user10, order: 3 }
  ]
  chosen_genres = ChosenGenre.create!(chosen_genres) 

  chosen_tags = [
    { user: user1, order: 1 },
    { user: user2, order: 1 },
    { user: user3, order: 1 },
    { user: user4, order: 1 },
    { user: user5, order: 1 },
    { user: user6, order: 1 },
    { user: user7, order: 1 },
    { user: user8, order: 1 },
    { user: user9, order: 1 },
    { user: user10, order: 1 }
  ]
  chosen_tag = ChosenTag.create!(chosen_tags) 



# Path to the video file guide help
#video_path = Rails.root.join('db/videos/example_video.mp4')

# Attach the video to the post
#post.videos.attach(io: File.open(video_path), filename: 'example_video.mp4', content_type: 'video/mp4')


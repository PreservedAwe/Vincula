# This file should ensure the existence of records required to run the application in every environment
# The code here should be idempotent so that it can be executed at any point in every environment

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
].freeze

# Use bulk import with error handling for better performance
begin
  Genre.upsert_all(genres)
rescue ActiveRecord::StatementInvalid => e
  Rails.logger.error("Failed to seed genres: #{e.message}")
  # Handle existing records by finding or creating them
  genres.each do |genre|
    Genre.find_or_create_by!(name: genre[:name])
  end
end

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
].freeze

begin
  Tag.upsert_all(tags)
rescue ActiveRecord::StatementInvalid => e
  Rails.logger.error("Failed to seed tags: #{e.message}")
  tags.each do |tag|
    Tag.find_or_create_by!(name: tag[:name])
  end
end

# Seed search types
search_types = [
  { name: 'Artist' },
  { name: 'Genre' },
  { name: 'Tag' }
].freeze

begin
  SearchType.upsert_all(search_types)
rescue ActiveRecord::StatementInvalid => e
  Rails.logger.error("Failed to seed search types: #{e.message}")
  search_types.each do |search_type|
    SearchType.find_or_create_by!(name: search_type[:name])
  end
end

# Seed users with batch processing
users_data = [
  { email: 'user1@example.com', password: 'password1', username: 'u_owe_me_soda', ip_address: "173.242.180.229" },
  { email: 'user2@example.com', password: 'password2', username: 'tangerony', ip_address: "192.206.151.131" },
  { email: 'user3@example.com', password: 'password3', username: 'user3_awesome', ip_address: "192.206.151.132" },
  { email: 'user4@example.com', password: 'password4', username: 'rockstar22', ip_address: "192.206.151.133" },
  { email: 'user5@example.com', password: 'password5', username: 'musiclover555', ip_address: "192.206.151.134" },
  { email: 'user6@example.com', password: 'password6', username: 'beatsmaker77', ip_address: "192.206.151.135" },
  { email: 'user7@example.com', password: 'password7', username: 'rhythm_master', ip_address: "192.206.151.136" },
  { email: 'user8@example.com', password: 'password8', username: 'groovy_cat', ip_address: "192.206.151.137" },
  { email: 'user9@example.com', password: 'password9', username: 'melody_maker', ip_address: "192.206.151.138" },
  { email: 'user10@example.com', password: 'password10', username: 'harmony_lover', ip_address: "192.206.151.139" }
].freeze

users_data.each do |user_data|
  user = User.find_or_initialize_by(email: user_data[:email])
  user.assign_attributes(
    password: user_data[:password],
    username: user_data[:username],
    ip_address: user_data[:ip_address]
  )
  user.save!
rescue ActiveRecord::RecordInvalid => e
  Rails.logger.error("Failed to create user #{user_data[:email]}: #{e.message}")
end

# Process users in batches for profile pictures
User.find_each do |user|
  begin
    user.profile_picture.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')),
      filename: 'default-user.png',
      content_type: 'image/png'
    )
  rescue StandardError => e
    Rails.logger.error("Error setting profile picture for user #{user.id}: #{e.message}")
  end
end

# Seed settings in batches
settings_data = [
  { user_id: 1, max_distance: 36, is_enabled: true, genre_id: 1, search_type: 1 },
  { user_id: 2, max_distance: 78, is_enabled: false, genre_id: 1, search_type: 2 },
  { user_id: 3, max_distance: 42, is_enabled: true, genre_id: 17, search_type: 2 },
  { user_id: 4, max_distance: 87, is_enabled: false, genre_id: 4, search_type: 1 },
  { user_id: 5, max_distance: 15, is_enabled: true, genre_id: 12, search_type: 3 },
  { user_id: 6, max_distance: 29, is_enabled: false, genre_id: 8, search_type: 2 },
  { user_id: 7, max_distance: 63, is_enabled: true, genre_id: 19, search_type: 1 },
  { user_id: 8, max_distance: 50, is_enabled: false, genre_id: 3, search_type: 3 },
  { user_id: 9, max_distance: 72, is_enabled: true, genre_id: 14, search_type: 2 },
  { user_id: 10, max_distance: 87, is_enabled: false, genre_id: 4, search_type: 1 }
].freeze

begin
  Setting.upsert_all(settings_data)
rescue ActiveRecord::StatementInvalid => e
  Rails.logger.error("Failed to seed settings: #{e.message}")
  settings_data.each do |setting|
    Setting.find_or_create_by!(
      user_id: setting[:user_id],
      max_distance: setting[:max_distance],
      is_enabled: setting[:is_enabled],
      genre_id: setting[:genre_id],
      tag_id: setting[:tag_id],
      search_type: setting[:search_type]
    )
  end
end

# Seed chosen artists in batches
chosen_artists_data = [
  { user_id: 1, order: 1 },
  { user_id: 1, order: 2 },
  { user_id: 1, order: 3 },
  { user_id: 2, order: 1 },
  { user_id: 2, order: 2 },
  { user_id: 2, order: 3 },
  { user_id: 3, order: 1 },
  { user_id: 3, order: 2 },
  { user_id: 3, order: 3 },
  { user_id: 4, order: 1 },
  { user_id: 4, order: 2 },
  { user_id: 4, order: 3 },
  { user_id: 5, order: 1 },
  { user_id: 5, order: 2 },
  { user_id: 5, order: 3 },
  { user_id: 6, order: 1 },
  { user_id: 6, order: 2 },
  { user_id: 6, order: 3 },
  { user_id: 7, order: 1 },
  { user_id: 7, order: 2 },
  { user_id: 7, order: 3 },
  { user_id: 8, order: 1 },
  { user_id: 8, order: 2 },
  { user_id: 8, order: 3 },
  { user_id: 9, order: 1 },
  { user_id: 9, order: 2 },
  { user_id: 9, order: 3 },
  { user_id: 10, order: 1 },
  { user_id: 10, order: 2 },
  { user_id: 10, order: 3 }
].freeze

begin
  ChosenArtist.upsert_all(chosen_artists_data)
rescue ActiveRecord::StatementInvalid => e
  Rails.logger.error("Failed to seed chosen artists: #{e.message}")
  chosen_artists_data.each do |artist|
    ChosenArtist.find_or_create_by!(user_id: artist[:user_id], order: artist[:order])
  end
end

# Seed chosen genres in batches
chosen_genres_data = [
  { user_id: 1, order: 1 },
  { user_id: 1, order: 2 },
  { user_id: 1, order: 3 },
  { user_id: 2, order: 1 },
  { user_id: 2, order: 2 },
  { user_id: 2, order: 3 },
  { user_id: 3, order: 1 },
  { user_id: 3, order: 2 },
  { user_id: 3, order: 3 },
  { user_id: 4, order: 1 },
  { user_id: 4, order: 2 },
  { user_id: 4, order: 3 },
  { user_id: 5, order: 1 },
  { user_id: 5, order: 2 },
  { user_id: 5, order: 3 },
  { user_id: 6, order: 1 },
  { user_id: 6, order: 2 },
  { user_id: 6, order: 3 },
  { user_id: 7, order: 1 },
  { user_id: 7, order: 2 },
  { user_id: 7, order: 3 },
  { user_id: 8, order: 1 },
  { user_id: 8, order: 2 },
  { user_id: 8, order: 3 },
  { user_id: 9, order: 1 },
  { user_id: 9, order: 2 },
  { user_id: 9, order: 3 },
  { user_id: 10, order: 1 },
  { user_id: 10, order: 2 },
  { user_id: 10, order: 3 }
].freeze

begin
  ChosenGenre.upsert_all(chosen_genres_data)
rescue ActiveRecord::StatementInvalid => e
  Rails.logger.error("Failed to seed chosen genres: #{e.message}")
  chosen_genres_data.each do |genre|
    ChosenGenre.find_or_create_by!(user_id: genre[:user_id], order: genre[:order])
  end
end

# Seed chosen tags
chosen_tags_data = [
  { user_id: 1, order: 1 },
  { user_id: 2, order: 1 },
  { user_id: 3, order: 1 },
  { user_id: 4, order: 1 },
  { user_id: 5, order: 1 },
  { user_id: 6, order: 1 },
  { user_id: 7, order: 1 },
  { user_id: 8, order: 1 },
  { user_id: 9, order: 1 },
  { user_id: 10, order: 1 }
].freeze

begin
  ChosenTag.upsert_all(chosen_tags_data)
rescue ActiveRecord::StatementInvalid => e
  Rails.logger.error("Failed to seed chosen tags: #{e.message}")
  chosen_tags_data.each do |tag|
    ChosenTag.find_or_create_by!(user_id: tag[:user_id], order: tag[:order])
  end
end
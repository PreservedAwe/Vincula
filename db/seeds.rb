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
users = User.create!([
 { email: 'user1@example.com', password: 'password1', username: 'taestyy11' },
 { email: 'user2@example.com', password: 'password2', username: 'taestyyyweeqeqe' }
])

# Seed settings
settings = Setting.create!([
 { user: users.first, gender: 'male' },
 { user: users.last, gender: 'female' }
])      

# Seed conversations
conversation = Conversation.create!()


# Seed messages
messages = Message.create!([
 { body: 'Hello, world!', user: users.first, conversation: conversation},
 { body: 'How are you?', user: users.last, conversation: conversation}
])


# Path to the video file
video_path = Rails.root.join('db/videos/example_video.mp4')

# Attach the video to the post
post.videos.attach(io: File.open(video_path), filename: 'example_video.mp4', content_type: 'video/mp4')


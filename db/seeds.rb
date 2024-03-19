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
user1 = User.create!(email: 'user1@ex.com', password: 'password1', username: 'taestyy11')
user2 = User.create!(email: 'user2@ex.com', password: 'password2', username: 'taestyy40222')

# Seed settings
user1Settings = user1.create_setting(min_distance: 4, max_distance: 36)   
user2Settings = user2.create_setting(min_distance: 9, max_distance: 15)  

# Seed conversations
conversation = Conversation.create!(sender: user1.id, receipient: user2.id)

# Seed messages
message1 = Message.create!(body: "Hi how are you", sender: user1.id, conversation: conversation)
message2 = Message.create!(body: "Hi how are you", sender: user2.id, conversation: conversation)



# Path to the video file guide help
#video_path = Rails.root.join('db/videos/example_video.mp4')

# Attach the video to the post
#post.videos.attach(io: File.open(video_path), filename: 'example_video.mp4', content_type: 'video/mp4')


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed data for Animation Projects
AnimationProject.create!(
  title: "Ocean Adventures",
  description: "A short animation exploring the depths of the ocean and its mysterious inhabitants.",
  cover_image_url: "https://www.publicdomainpictures.net/pictures/320000/nahled/background-image.png",
  video_url: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
  images: [
    "https://www.publicdomainpictures.net/pictures/20000/nahled/starry-night.jpg",
    "https://www.publicdomainpictures.net/pictures/10000/nahled/1-1193219094.jpg"
  ],
  videos: [
    "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4"
  ],
  tags: ["ocean", "adventure", "mystery"]
)

# Seed data for Programming Projects
ProgrammingProject.create!(
  title: "Portfolio Website",
  description: "A personal portfolio website to showcase my software development and animation projects.",
  technologies_used: "Ruby on Rails, JavaScript, CSS",
  live_url: "http://example.com",
  cover_image_url: "https://www.publicdomainpictures.net/pictures/30000/nahled/map-of-the-world-1371772257P4n.jpg",
  images: [
    "https://www.publicdomainpictures.net/pictures/10000/nahled/zebra-head-11281366876AZ3M.jpg",
    "https://www.publicdomainpictures.net/pictures/200000/nahled/electric-guitar-1493126318Zrn.jpg"
  ],
  tags: ["web development", "personal", "portfolio"]
)

puts "Database seeded!"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

# Before clearing existing data seed should purge cloudinary images so that we don't have duplicates
# Should this be done in the production seed too?

# Clear existing data
AnimationProject.delete_all
ProgrammingProject.delete_all



# Seed data for Programming Projects

midpoint_cover_photo = URI.open("https://res.cloudinary.com/dxvi2kqnz/image/upload/v1713521723/MidpointCoverPhoto_vjknxu.png")
midpoint_style_photo = URI.open("https://res.cloudinary.com/dxvi2kqnz/image/upload/v1713530643/MidpointTypographyAndColours_gvdank.png")

midpoint = ProgrammingProject.new(
  title: "Midpoint",
  description: "A flight searching site that helps travellers find the best midpoint destinations for meeting up with friends and family.",
  technologies_used: "Ruby on Rails, Figma, JavaScript, SCSS",
  live_url: "http://midpoint.world",
  tags: ["web development", "design", "travel"]
)

midpoint.cover_photo.attach(io: midpoint_cover_photo, filename: "midpoint_cover_photo.png", content_type: "image/png")
midpoint.photos.attach(io: midpoint_style_photo, filename: "midpoint_style_photo.png", content_type: "image/png")

midpoint.save!


# ProgrammingProject.create!(
#   title: "Byemalin Test Portfolio Website",
#   description: "A personal portfolio website to showcase my software development and animation projects.",
#   technologies_used: "Ruby on Rails, JavaScript, CSS",
#   live_url: "http://byemalin.com",
#   tags: ["web development", "personal", "portfolio"]
# )


# Seed data for Animation Projects
AnimationProject.create!(
  title: "Ocean Adventures",
  description: "A short animation exploring the depths of the ocean and its mysterious inhabitants.",
  video_url: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
  videos: [
    "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4"
  ],
  tags: ["ocean", "adventure", "mystery"]
)

puts "Database seeded!"

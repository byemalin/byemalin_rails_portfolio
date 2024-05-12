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
puts "Purging cloudinary before seeding..."
all_projects = AnimationProject.all + ProgrammingProject.all

all_projects.each do |project|
  puts "PURGING: #{project}"
  project.cover_photo.purge if project.cover_photo.attached?
  project.photos.purge if project.photos.attached?
end

puts "Clearing existing project data..."
# Clear existing data
AnimationProject.delete_all
ProgrammingProject.delete_all



# Seed data for Programming Projects

# MIDPOINT
puts "Creating Midpoint..."
puts "Saving photos"
midpoint_cover_photo = URI.open("https://res.cloudinary.com/dxvi2kqnz/image/upload/v1713521723/MidpointCoverPhoto_vjknxu.png")
midpoint_style_photo = URI.open("https://res.cloudinary.com/dxvi2kqnz/image/upload/v1713530643/MidpointTypographyAndColours_gvdank.png")


midpoint = ProgrammingProject.new(
  title: "Midpoint",
  sub_heading: "A flight searching site that helps travellers find the best midpoint destinations for meeting up with friends and family.",
  technologies_used: "Ruby on Rails, Figma, JavaScript, SCSS",
  live_url: "http://midpoint.world",
  tags: ["web development", "design", "travel"],
  vimeo_id: "940391688",
  description: "Midpoint is a web application that allows users to search for flights from 2 different departure locations, and see suggestions for places to meet, based on flight information.\n

  I led a team of 3 developers to create this MVP in 2 weeks for the final project of our web development bootcamp.\n

  My main focus on this project was ideation, design, and front-end implementation. However, as it was a learning experience, all team members worked in a full stack capacity."
)

midpoint.cover_photo.attach(io: midpoint_cover_photo, filename: "midpoint_cover_photo.png", content_type: "image/png")
midpoint.photos.attach(io: midpoint_style_photo, filename: "midpoint_style_photo.png", content_type: "image/png")

midpoint.save!


# TERRAIN
puts "Creating Terrain..."
puts "Saving photos"
terrain_cover_photo = URI.open("https://res.cloudinary.com/dxvi2kqnz/image/upload/v1714369007/TerrainCover2_jhbwo8.png")
# midpoint_style_photo = URI.open("https://res.cloudinary.com/dxvi2kqnz/image/upload/v1713530643/MidpointTypographyAndColours_gvdank.png")


terrain = ProgrammingProject.new(
  title: "Terrain",
  sub_heading: "A web based drawing tool that I created to facilitate my artistic practice.",
  technologies_used: "Javascript, UI Design, Drawing Tool",
  live_url: "http://byemalin.com/terrain",
  tags: ["web development", "design", "art"],
  description: "Terrain was one of my first programming projects \n
  It served as testement to the idea that my final thesis focused on: Coding should be a major part of fine art education.\n
  \n
  My artistic practice was previously focused on physical techniques for creating abstract, fictional elevation maps. \n
  The idea for terrain was to allow for rapid prototyping of similar drawings.\n
  \n
  Please try it out and feel free to see one example use case below.
  ",
  tiktok_id: "7250558642804509978"
)

terrain.cover_photo.attach(io: terrain_cover_photo, filename: "midpoint_cover_photo.png", content_type: "image/png")
# midpoint.photos.attach(io: midpoint_style_photo, filename: "midpoint_style_photo.png", content_type: "image/png")

terrain.save!



# Seed data for Animation Projects
puts "Seeding Data for Animation Projects"


# Nodaleto

puts "Seeding Nodaleto"

puts "Saving Photos and Videos"
nodaleto_cover_photo = URI.open("https://res.cloudinary.com/dxvi2kqnz/image/upload/v1715521917/animation_videos/Nodaleto/zoomBulla_cmobpa.png")

nodaleto_video_1 = URI.open("https://res.cloudinary.com/dxvi2kqnz/video/upload/v1715519446/animation_videos/Nodaleto/nodaleto_cloth_xhqp0v.mp4")
nodaleto_video_2 = URI.open("https://res.cloudinary.com/dxvi2kqnz/video/upload/v1715519327/animation_videos/Nodaleto/nodaleto_box_reveal_klkgyi.mp4")


nodaleto = AnimationProject.new(
  title: "Nodaleto",
  description: "My personal take on 2 product animations inspired by Nodaleto's Bulla Rina. These weren't commisioned works.",
  tags: ["Product Visualisation", "Fashion", "3D Modelling"]
)

nodaleto.cover_photo.attach(io: nodaleto_cover_photo, filename: "nodaleto_cover_photo.png", content_type: "image/png")
nodaleto.videos.attach(io: nodaleto_video_1, filename: "nodaleto_video_1.png")
nodaleto.videos.attach(io: nodaleto_video_2, filename: "nodaleto_video_2.png")

nodaleto.save!


puts "Database seeded!"

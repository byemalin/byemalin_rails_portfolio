class AnimationProject < ApplicationRecord
  has_one_attached :cover_photo
  has_many_attached :photos
  has_many_attached :videos
end

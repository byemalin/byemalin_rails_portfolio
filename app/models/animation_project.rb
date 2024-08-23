class AnimationProject < ApplicationRecord
  has_one_attached :cover_photo
  has_many_attached :photos
  has_many_attached :videos

  validates :cover_photo, presence: true
end

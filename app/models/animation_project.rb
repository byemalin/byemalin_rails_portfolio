class AnimationProject < ApplicationRecord
  has_one_attached :cover_photo
  has_many_attached :photos
  self.ignored_columns += ["video_url", "videos"]
end

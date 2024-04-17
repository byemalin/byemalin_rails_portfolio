class AnimationProject < ApplicationRecord
  self.ignored_columns += ["cover_image_url", "images"]
end

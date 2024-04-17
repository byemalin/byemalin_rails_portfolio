class ProgrammingProject < ApplicationRecord
  # has_one_attached :photo
  has_many_attached :photos
  self.ignored_columns += ["cover_image_url", "images"]
end

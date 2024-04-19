class ProgrammingProject < ApplicationRecord
  has_one_attached :cover_photo
  has_many_attached :photos
end

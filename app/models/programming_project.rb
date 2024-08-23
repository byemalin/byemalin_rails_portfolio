class ProgrammingProject < ApplicationRecord
  has_one_attached :cover_photo
  has_many_attached :photos

  validates :cover_photo, presence: true
end

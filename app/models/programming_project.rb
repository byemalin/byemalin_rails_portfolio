class ProgrammingProject < ApplicationRecord
  has_one_attached :cover_photo
  has_many_attached :photos

  has_rich_text :rich_description

  validates :cover_photo, presence: true
end

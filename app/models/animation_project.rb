class AnimationProject < ApplicationRecord
  has_one_attached :cover_photo
  has_many_attached :photos
  has_many_attached :videos

  has_rich_text :rich_description

  validates :cover_photo, presence: true

  # Virtual attribute for removing the cover photo
  attr_accessor :remove_cover_photo

  # Callback to check for the cover photo removal
  before_save :check_remove_cover_photo

  private

  def check_remove_cover_photo
    cover_photo.purge if remove_cover_photo == '1'
  end

end

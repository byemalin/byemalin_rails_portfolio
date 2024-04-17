class RemoveImagesFromAnimationProjects < ActiveRecord::Migration[7.1]
  def change
    safety_assured { remove_column :animation_projects, :images }
    safety_assured { remove_column :animation_projects, :cover_image_url }
  end
end

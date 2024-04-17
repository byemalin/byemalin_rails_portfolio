class RemoveCoverImageUrlFromProgrammingProjects < ActiveRecord::Migration[7.1]
  def change
    safety_assured { remove_column :programming_projects, :cover_image_url }
  end
end

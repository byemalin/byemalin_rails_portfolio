class RemoveImagesFromProgrammingProjects < ActiveRecord::Migration[7.1]
  def change
    safety_assured { remove_column :programming_projects, :images }
  end
end

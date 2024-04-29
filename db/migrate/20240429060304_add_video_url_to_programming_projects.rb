class AddVideoUrlToProgrammingProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :programming_projects, :video_url, :string
  end
end

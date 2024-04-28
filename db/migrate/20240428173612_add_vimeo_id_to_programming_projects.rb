class AddVimeoIdToProgrammingProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :programming_projects, :vimeo_id, :string
  end
end

class AddTiktokIdToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :programming_projects, :tiktok_id, :string
    add_column :animation_projects, :tiktok_id, :string
  end
end

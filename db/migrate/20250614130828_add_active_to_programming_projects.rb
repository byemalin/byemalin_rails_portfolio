class AddActiveToProgrammingProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :programming_projects, :active, :boolean, default: true, null: true
  end
end

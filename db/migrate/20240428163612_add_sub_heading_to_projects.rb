class AddSubHeadingToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :programming_projects, :sub_heading, :string
    add_column :animation_projects, :sub_heading, :string
  end
end

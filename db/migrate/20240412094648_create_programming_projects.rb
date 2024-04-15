class CreateProgrammingProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :programming_projects do |t|
      t.string :title
      t.text :description
      t.text :technologies_used
      t.string :live_url
      t.string :cover_image_url
      t.string :images, array: true, default: []
      t.string :tags, array: true, default: []

      t.timestamps
    end
  end
end

class CreateAnimationProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :animation_projects do |t|
      t.string :title
      t.text :description
      t.string :cover_image_url
      t.string :video_url
      t.string :images, array: true, default: []
      t.string :videos, array: true, default: []
      t.string :tags, array: true, default: []

      t.timestamps
    end
  end
end

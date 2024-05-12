class RemoveVideoUrlAndVideosFromAnimationProjects < ActiveRecord::Migration[7.1]
  def change
    remove_column :animation_projects, :video_url, :string
    remove_column :animation_projects, :videos, :string, array: true, default: []
  end
end

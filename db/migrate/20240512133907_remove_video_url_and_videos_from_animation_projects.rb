class RemoveVideoUrlAndVideosFromAnimationProjects < ActiveRecord::Migration[7.1]
  def change
    safety_assured { remove_column :animation_projects, :video_url }
    safety_assured { remove_column :animation_projects, :videos }
  end
end

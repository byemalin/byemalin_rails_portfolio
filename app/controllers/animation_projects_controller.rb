class AnimationProjectsController < ApplicationController
  def index
    @animation_projects = AnimationProject.all
  end

  def show
    @project = AnimationProject.find(params[:id])
  end

  def new
    @animation_project = AnimationProject.new
  end

  def create
    @animation_project = AnimationProject.new(animation_project_params)
    if @animation_project.save
      redirect_to animation_projects_path, notice: 'Animation project was successfully created.'
    else
      render :new
    end
  end

  private

  def animation_project_params
    params.require(:animation_project).permit(:title, :sub_heading, :cover_photo, :description, :tiktok_id, videos: [], tags: [], photos: [])
  end
end

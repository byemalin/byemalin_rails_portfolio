class AnimationProjectsController < ApplicationController

  before_action :set_animation_project, only: [:edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:new, :create, :edit, :update]  # for user-specific access control



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

  def edit
    # The 'set_animation_project' before_action loads the project to edit
  end



  def update
    # Handle cover photo deletion
    if params[:animation_project][:remove_cover_photo] == '1'
      @animation_project.cover_photo.purge
    end

    # Handle additional photos deletion
    if params[:animation_project][:remove_photos].present?
      removable_ids = params[:animation_project][:remove_photos].map(&:to_i)
      @animation_project.photos.each do |photo|
        photo.purge if removable_ids.include?(photo.id)
      end
    end

    if @animation_project.update(animation_project_params)
      redirect_to animation_projects_path, notice: 'Animation project was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_animation_project
    @animation_project = AnimationProject.find(params[:id])
  end


  def animation_project_params
    params.require(:animation_project).permit(
      :title, :sub_heading, :description, :video_url,
      :remove_cover_photo, # Ensure this is a single symbol
      videos: [], # Using colon notation directly for arrays
      tags: [],
      photos: [],
      remove_photos: [], # Using colon notation for hashes
      remove_videos: []  # No comma needed after the last item
    )
  end




  def check_user
    # Ensure only the allowed user can edit and update the project
    redirect_to root_path, alert: "Unauthorized access!" unless current_user && current_user.is_admin?
  end

end

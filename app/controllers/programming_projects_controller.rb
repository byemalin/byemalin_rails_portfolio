class ProgrammingProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, only: [:new, :create, :edit, :update]

  def index
    @programming_projects = ProgrammingProject.all
    @programming_projects = @programming_projects.order(created_at: :asc)

  end

  def show
    @project = ProgrammingProject.find(params[:id])
  end

  def new
    @programming_project = ProgrammingProject.new
  end

  def create
    @programming_project = ProgrammingProject.new(programming_project_params)
    if @programming_project.save
      redirect_to programming_projects_path, notice: 'Project was successfully created.'
    else
      render :new
    end
  end


  before_action :set_programming_project, only: [:edit, :update]

  def edit
  end

  def update
    if params[:programming_project][:remove_cover_photo] == '1'
      @programming_project.cover_photo.purge
    end

    if params[:programming_project][:remove_photos]
      params[:programming_project][:remove_photos].each do |photo_id|
        photo = @programming_project.photos.find(photo_id)
        photo.purge
      end
    end

    if @programming_project.update(programming_project_params)
      redirect_to programming_projects_path, notice: 'Programming project was successfully updated.'
    else
      render :edit
    end
  end

  private

  def check_user
    redirect_to root_path, alert: "Unauthorized access!" unless current_user && current_user.is_admin?
  end

  def set_programming_project
    @programming_project = ProgrammingProject.find(params[:id])
  end

  def programming_project_params
    params.require(:programming_project).permit(:title, :description, :technologies_used, :live_url, :tags, :cover_photo, :rich_description, :active, :tiktok_id, :vimeo_id, photos: [])
  end
end

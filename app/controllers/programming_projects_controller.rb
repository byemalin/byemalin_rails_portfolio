class ProgrammingProjectsController < ApplicationController
  def index
    @programming_projects = ProgrammingProject.all
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
    if @programming_project.update(programming_project_params)
      redirect_to programming_projects_path, notice: 'Programming project was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_programming_project
    @programming_project = ProgrammingProject.find(params[:id])
  end

  def programming_project_params
    params.require(:programming_project).permit(:title, :description, :technologies_used, :live_url, :tags, :cover_photo, photos: [])
  end
end

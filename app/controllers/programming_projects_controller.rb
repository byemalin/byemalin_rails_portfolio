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

  private

  def programming_project_params
    params.require(:programming_project).permit(:title, :description, :technologies_used, :live_url, :tags)
  end
end

class ProgrammingProjectsController < ApplicationController
  def index
    @programming_projects = ProgrammingProject.all
  end

  def show
    @project = ProgrammingProject.find(params[:id])
  end
end

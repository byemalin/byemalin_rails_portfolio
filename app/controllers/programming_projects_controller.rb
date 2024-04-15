class ProgrammingProjectsController < ApplicationController
  def index
    @programming_projects = ProgrammingProject.all
  end
end

class AnimationProjectsController < ApplicationController
  def index
    @animation_projects = AnimationProject.all
  end

  def show
    @project = AnimationProject.find(params[:id])
  end
end

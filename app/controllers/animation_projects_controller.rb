class AnimationProjectsController < ApplicationController
  def index
    @animation_projects = AnimationProject.all
  end
end

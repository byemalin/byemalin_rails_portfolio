class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:about, :landing, :contact, :home]
  # before_action :authenticate_user!, only: [:dashboard, :profile]
  before_action :authenticate_user!, only: [:terrain]
end

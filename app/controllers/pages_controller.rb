class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:about, :landing, :contact, :home]
end

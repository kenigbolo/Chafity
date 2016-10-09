class HomeController < ApplicationController
  def index
    redirect_to user_path current_user unless current_user.nil?
  end
end

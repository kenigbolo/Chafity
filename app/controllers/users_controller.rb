class UsersController < ApplicationController
  
  def show
  	@user = User.where("id = ?", params[:id])[0]
  end
end

class UsersController < ApplicationController
  
  def show
  	@user = params[:id]
  end
end

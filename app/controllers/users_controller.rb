class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # TODO: this is a temporary search method to be improved soon
    @users = User.search(params[:search])
  end

  def show
    @user = User.find(current_user.id) if current_user
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

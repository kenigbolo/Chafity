class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # TODO: this is a temporary search method to be improved soon
    @users = User.search(params[:search])
  end

  def show
    @user = User.friendly.find(params[:id])
    @messages = @user.messages.all
    @received = Message.where("receiver_id = ?", current_user.id)
  end

end

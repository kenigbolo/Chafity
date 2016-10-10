class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # TODO: this is a temporary search method to be improved soon
    @charities = Charity.all
    puts params[:search]
    if params[:search]
    @users = User.search(params[:search])
    else
      render :index
    end
  end

  def show
    @user = User.friendly.find(params[:id])
    @charity = Charity.find(1)
    @messages = @user.messages.all
    @received = Message.where("receiver_id = ?", current_user.id)
    @response = Response.new
  end

end

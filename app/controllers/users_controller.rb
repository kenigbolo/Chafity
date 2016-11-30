class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @charities = Charity.all
    if params[:search].present?
      @users = User.search(params[:search])
      @users.order(:first_name)
    else
      @users = User.order(:first_name)
      render :index
    end
  end

  def show
    @user = User.friendly.find(params[:id])
    @charity = Charity.find_by(user_id: @user.id)
    @sent_messages = @user.messages.all
    @received_messages = Message.where(receiver_id: current_user.id)
    @response = Response.new
  end
end

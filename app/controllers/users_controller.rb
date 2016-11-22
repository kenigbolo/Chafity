class UsersController < ApplicationController
  before_action :authenticate_user!

  def index

    constraints = {
        available_users: User.all,
        available_charities: Charity.all
    }

    @charities = Charity.all

    if params[:search].present?
      @users = User.search(params[:search])
      @users.order(:first_name)
    else
      @users_search = Search.new(users_search_params).with_constraints(constraints)
      @users = @users_search.execute
    end


    @users_search = Search.new(users_search_params).with_constraints(constraints)
    # @users = @users_search.execute

  end


  def show
    @user = User.friendly.find(params[:id])
    @charity = Charity.find_by(user_id: @user.id)
    @messages = @user.messages.all
    @received = Message.where(receiver_id: current_user.id)
    @response = Response.new
  end

  def users_search_params
    return {} if !params[:advanced_search]

    params
        .require(:advanced_search)
        .permit(:location, :languages, :industry, :charity_name, :country, :company, :search)
  end
end

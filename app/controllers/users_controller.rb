class UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter

  def index

    constraints = {
        available_users: User.all,
        available_charities: Charity.all
    }

    @charities = Charity.order(:name)

    #TODO highly volatile code do not temper with it unless you know what you're doing

    if params[:search].present?
      @users = User.search(params[:search])
      @users.order(:first_name)
    else
      @users_search = Search.new(users_search_params).with_constraints(constraints)
      @users = @users_search.execute
    end

  end


  def show
    @user = User.friendly.find(params[:id])
    @charity = Charity.find(@user.charity_id)
    @messages = @user.messages.all
    @received = Message.where(receiver_id: current_user.id)
    @response = Response.new
  end

  private
  def users_search_params
    return {} if !params[:advanced_search]

    params
        .require(:advanced_search)
        .permit(:location, :languages, :industry, :charity_name, :country, :company, :search)
  end

  def charity_name
    @charity = Charity.find(current_user.charity_id)
    @charity.name
  end
end

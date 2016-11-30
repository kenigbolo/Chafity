class UsersController < ApplicationController
  before_action :authenticate_user!


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
    @charity = Charity.find(@user.charity_id) unless @user.charity_id.nil?
    @sent_messages = @user.messages.all
    @received_messages = Message.where(receiver_id: current_user.id)
    @response = Response.new
  end

  private
  def users_search_params
    return {} if !params[:advanced_search]

    params
        .require(:advanced_search)
        .permit(:location, :languages, :industry, :charity_id, :country, :company, :search)
  end
end

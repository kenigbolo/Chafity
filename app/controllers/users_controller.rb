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

  def suggestion
    suggestion = Suggestion.new(suggestion_params)
    if suggestion.save!
      UserMailer.send_suggestion(suggestion).deliver
      flash[:notice] = 'Your suggestion has been successfully saved. We will get back to you shortly!'
    else
      flash[:notice] = 'Something went wrong, please try again!'
    end
  end

  private
  def users_search_params
    return {} if !params[:advanced_search]

    params
        .require(:advanced_search)
        .permit(:location, :languages, :industry, :charity_id, :country, :company, :search)
  end

  def suggestion_params
    params.require(:suggestion).permit(:charity_name, :user_id)
  end
end

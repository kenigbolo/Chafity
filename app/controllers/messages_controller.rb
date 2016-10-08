class MessagesController < ApplicationController

  before_action :set_user, :authenticate_user!

  def index
    @messages = @user.messages.all
  end

  def new
    @message = @user.messages.build
  end

  def create

  end

  private
  def set_user
    @user = current_user
  end

end

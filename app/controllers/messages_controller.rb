class MessagesController < ApplicationController

  before_action :set_user, :authenticate_user!

  def new
    @message = @user.messages.build
  end

  def create
    @message = @user.messages.new(message_params)
    if @message.save
      flash[:success] = "Message sent"
      redirect_to request.referrer
    else
     # TODO: hummmm
    end
  end

  def reply
    @response = Response.new
  end

  private
  def set_user
    @user = current_user
  end

  private
    def message_params
      params.require(:message).permit(:sender_id, :receiver_id, :message_body, :appointment_date)
    end
end

# This is the message controller rubocop
class MessagesController < ApplicationController
  before_action :set_user, :authenticate_user!

  def new
    @message = @user.messages.build
  end

  def create
    @message = @user.messages.new(message_params)
    if @message.save!
      flash[:notice] = "Successfully created..."
      redirect_to request.referrer
    else
      flash[:notice] = "Something went went wrong while we tried to send your message..."
      # respond_to do |format|
      #   format.js do
      #     render inline: 'location.reload();'
      #   end
      # end
    end
  end

  def reply
    @response = Response.new
  end

  private
    def set_user
      @user = current_user
    end

    def message_params
      params
      .require(:message)
      .permit(:sender_id, :receiver_id, :message_body, :appointment_date)
    end
end

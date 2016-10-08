class ResponsesController < ApplicationController

  def create
    Response.create(reply_params)
    redirect_to request.referrer
  end

  private
  def reply_params
    params.require(:response).permit(:body, :message_id)
  end
end

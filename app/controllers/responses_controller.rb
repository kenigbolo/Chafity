class ResponsesController < ApplicationController

  def create
    response = create_response
    if response.save!
      flash[:notice] = "Your response has been sent successfully"
      redirect_to request.referrer
    else
      flash[:notice] = "Something went wrong, please try again!"
      redirect_to request.referrer
    end
  end

  def schedule
    response = create_response
    if response.save!
      flash[:notice] = "Your appointment schedule has been sent successfully"
      Schedule.create(response_id: response.id, schedule: DateTime.parse(response.body))
      redirect_to request.referrer
    else
      flash[:notice] = "Something went wrong, please try again!"
      redirect_to request.referrer
    end
  end

  def accept
    message_id = params[:id]
    Response.create!(body: "Accepted", message_id: message_id, user_id: current_user.id)
    message = Message.find(message_id)
    message.status = true
    if message.save!
      flash[:notice] = "Message has been accepted successfully"
      redirect_to request.referrer
    else
      flash[:notice] = "Something went wrong, please try again"
      redirect_back(fallback_location: root_path)
    end
  end

  def reject
    message_id = params[:id]
    Response.create!(body: "Rejected", message_id: message_id, user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  private
  def reply_params
    params.require(:response).permit(:body, :message_id)
  end

  def create_response
    response = Response.new(reply_params)
    response.message_id = params[:message_id]
    response.user_id = current_user.id
    response
  end
end

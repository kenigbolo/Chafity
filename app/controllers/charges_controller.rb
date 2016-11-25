class ChargesController < ApplicationController
  def new
  end 

  def create
    @amount = (params[:amount].to_f * 100).to_i

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: params[:desc],
      currency: 'eur'
    )

    session["payment"] = charge.status
    redirect_to user_path(params[:id])
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

end

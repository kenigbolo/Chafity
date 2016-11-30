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

    payment = Payment.create!(payment_number: SecureRandom.hex, payment_status: charge.status, transaction_id: charge.id, payee_id: params[:id], user_id: current_user.id)
    current_user.total_donated += params[:amount].to_i
    current_user.save!
    redirect_back(fallback_location: root_path)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

end

class UserMailer < ApplicationMailer
  default from: 'notification@chafity.com'
  def welcome_confirmation(user)
    @user = user
    mail to: @user.email, subject: 'Welcome to Chafity!'
  end

  def payment_confirmation(payment)
    @payment = payment
    mail to: @payment.user.email, subject: 'Payment status notification!'
  end

  def send_suggestion(suggestion)
    @suggestion = suggestion
    mail to: charities@chafity.com, from: @suggestion.user.email, subject: 'A charity has been suggested!'
  end
end

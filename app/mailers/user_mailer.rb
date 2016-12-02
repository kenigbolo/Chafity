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
end

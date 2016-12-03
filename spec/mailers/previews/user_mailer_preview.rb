# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome_confirmation
  def welcome_confirmation
    UserMailerMailer.welcome_confirmation
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/payment_confirmation
  def payment_confirmation
    UserMailerMailer.payment_confirmation
  end

end

require "rails_helper"
require 'factory_girl'
RSpec.describe UserMailer, type: :mailer do
  user = User.new
  before(:all) do
      user.id = 1
      user.provider = 'facebook'
      user.uid = '1355889534440499'
      user.first_name = 'Kenigbolo'
      user.last_name =  'Meya Stephen'
      user.location = 'Estonia'
      user.headline = 'Software Engineer'
      user.industry = 'IT'
      user.email = 'expensivestephen@gmail.com'
  end
  payment = Payment.new

  before(:all) do
    payment.user_id = user.id
    payment.transaction_id = 'Test'
    payment.payment_status = 'successful'
    payment_number = 'Test'
    payment.payee_id = 2
  end

  suggestion = Suggestion.new
  before(:all) do
    suggestion.charity_name = 'Test'
    suggestion.user_id = user.id
  end

  describe "welcome_confirmation" do
    mail = UserMailer.welcome_confirmation(user)

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to Chafity!")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["notification@chafity.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(user.to_s)
    end
  end

  describe "payment_confirmation" do
    mail = UserMailer.payment_confirmation(payment)

    it "renders the headers" do
      expect(mail.subject).to eq("Payment status notification!")
      expect(mail.to).to eq([payment.user.email])
      expect(mail.from).to eq(["notification@chafity.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(payment.user.to_s)
    end
  end

  describe "send_suggestion" do
    mail = UserMailer.send_suggestion(suggestion)

    it "renders the headers" do
      expect(mail.subject).to eq("A charity has been suggested!")
      expect(mail.to).to eq(["charities@chafity.com"])
      expect(mail.from).to eq([suggestion.user.email])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(suggestion.user.to_s)
      expect(mail.body.encoded).to match(suggestion.charity_name)
    end
  end

end

require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome_confirmation" do
    let(:user) { FactoryGirl.build :user}
    let(:mail) { UserMailer.welcome_confirmation(user) }

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
    let(:payment) {FactoryGirl.build :payment}
    let(:mail) { UserMailer.payment_confirmation(payment) }

    it "renders the headers" do
      expect(mail.subject).to eq("Payment status notification!")
      expect(mail.to).to eq([payment.user.email])
      expect(mail.from).to eq(["notification@chafity.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(payment.user.to_s)
    end
  end

end

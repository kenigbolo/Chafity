require "rails_helper"

RSpec.describe UserMailerMailer, type: :mailer do
  describe "welcome_confirmation" do
    let(:mail) { UserMailerMailer.welcome_confirmation }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome confirmation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "payment_confirmation" do
    let(:mail) { UserMailerMailer.payment_confirmation }

    it "renders the headers" do
      expect(mail.subject).to eq("Payment confirmation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end

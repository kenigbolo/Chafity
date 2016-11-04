require 'rails_helper'

RSpec.describe Message, type: :model do

  context "When a message is created" do

    before do
      @message = Message.new
      @message.id = 1
      @message.sender_id = "1"
      @message.receiver_id = "2"
      @message.message_body = "I want to talk to you!!!"
      @message.appointment_date = "2016-10-23 16:00:00"
    end

    it "is a new message" do
      expect(@message).to be_a_new(Message)
    end

    it "should be a valid message object" do
      expect(@message).to be_valid
    end

    it "is expected to save message properly" do
      expect(@message.sender_id).to eq("1")
      expect(@message.receiver_id).to eq("2")
      expect(@message.message_body).to eq("I want to talk to you!!!")
      expect(@message.appointment_date).to eq("2016-10-23 16:00:00")
    end

  end

  context "when message doesn't have receiver_id" do
    before do
      @message = Message.new
      @message.id = 2
      @message.sender_id = "1"
      @message.message_body = "Another message"
      @message.appointment_date = "2016-10-25 14:10:00"
      @message.save
    end

    it "is a new message" do
      expect(@message).to be_a_new(Message)
    end

    it "should not be a valid message" do
      expect(@message).not_to be_valid
    end
  end

  context "when message doesn't have body" do
    before do
      @message = Message.new
      @message.id = 3
      @message.sender_id = "6"
      @message.receiver_id = "4"
      @message.appointment_date = "2016-07-20 01:00:00"
      @message.save
    end

    it "is a new message" do
      expect(@message).to be_a_new(Message)
    end

    it "should not be a valid message" do
      expect(@message).not_to be_valid
    end
  end

  context "when message doesn't have appointment_date" do
    before do
      @message = Message.new
      @message.id = 4
      @message.sender_id = "6"
      @message.receiver_id = "4"
      @message.message_body = "Why can't I send messages?!?!?!"
      @message.save
    end

    it "is a new message" do
      expect(@message).to be_a_new(Message)
    end

    it "should not be a valid message" do
      expect(@message).not_to be_valid
    end
  end

  context "when message doesn't have sender_id" do
    before do
      @message = Message.new
      @message.id = 5
      @message.receiver_id = "6"
      @message.message_body = "Let's talk next year"
      @message.appointment_date = "2017-01-01 00:00:01"
      @message.save
    end

    it "is a new message" do
      expect(@message).to be_a_new(Message)
    end

    it "should not be a valid message" do
      expect(@message).not_to be_valid
    end
  end

  context "When user creates a message" do
    before do
      user = User.create!(id: 1,
        provider: 'google',
        uid: '1234',
        email: 'someone@something.com',
        first_name: 'Someone',
        last_name: 'Important',
        location: 'Tartu',
        headline: 'something random',
        description: 'hjk',
        industry: 'something'
      )

      @message = user.messages.create!(message_body: 'I am toni',
        sender_id: '1',
        receiver_id: '2',
        appointment_date: Time.now,
      )
    end

    it "should be valid" do
      expect(@message).to be_valid
    end

    it "should be sent by user with id 1" do
      expect(@message.user_id).to eq(1)
    end

  end
end

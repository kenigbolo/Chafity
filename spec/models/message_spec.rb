require 'rails_helper'

RSpec.describe Message, type: :model do
  

	context "When a message is created" do

		before do
			@message = Message.new
	  	@message.id = 1
			@message.created_at = "2016-10-22 14:34:00"
			@message.updated_at = "2016-10-22 14:34:00"
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
			expect(@message.created_at).to eq("2016-10-22 14:34:00")
			expect(@message.updated_at).to eq("2016-10-22 14:34:00")
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
			@message.created_at = "2016-10-22 14:25:02"
			@message.updated_at = "2016-10-22 14:26:33"
			@message.sender_id = "1"
			@message.message_body = "Another message"
			@message.appointment_date = "2016-10-25 14:10:00"
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
			@message.created_at = "2016-05-10 22:22:00"
			@message.updated_at = "2016-06-10 14:37:03"
			@message.sender_id = "6"
			@message.receiver_id = "4"
			@message.appointment_date = "2016-07-20 01:00:00"
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
			@message.created_at = "2016-10-10 10:40:07"
			@message.updated_at = "2016-10-10 10:40:07"
			@message.sender_id = "6"
			@message.receiver_id = "4"
			@message.message_body = "Why can't I send messages?!?!?!"
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
			@message.created_at = "2015-01-01 00:00:01"
			@message.updated_at = "2016-01-01 00:00:01"
			@message.receiver_id = "6"
			@message.message_body = "Let's talk next year"
			@message.appointment_date = "2017-01-01 00:00:01"
		end

		it "is a new message" do
			expect(@message).to be_a_new(Message)
		end

		it "should not be a valid message" do
			expect(@message).not_to be_valid
		end
	end


end


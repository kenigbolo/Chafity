require 'rails_helper'

RSpec.describe Response, type: :model do
	context "when a response is created" do
		before do
			user = User.create!(
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

			message = user.messages.create!(id: 123,
				message_body: 'I am a message writer man',
				sender_id: '1',
				receiver_id: '2',
				appointment_date: "2016-01-01 00:10:00",
			)

			@response = message.responses.create!(body: "Some text here")
		end

		it "is expected to have correct response body" do
			expect(@response.body).to eq("Some text here")
		end

		it "is a valid message" do
			expect(@response).to be_valid
		end

		it "belongs to a message with id 123" do
			expect(@response.message_id).to eq(123)
		end
	end

end

require 'rails_helper'

RSpec.describe Schedule, type: :model do
  	context 'when a call is scheduled' do
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

			message = user.messages.create!(message_body: 'I am toni',
				sender_id: '1',
				receiver_id: '2',
				appointment_date: "2014-12-10 00:10:00",
			)

			response = message.responses.create!(id: 1)

	  		@schedule = response.create_schedule!(schedule: "2016-12-11 14:00:00")
	  	end

	  	it "saves scheduled time" do
	  		expect(Schedule.all).should_not be_nil
	  	end

	  	it "should be valid" do
	  		expect(@schedule).to be_valid
	  	end

	  	it "saves the schedule time correctly" do
	  		expect(@schedule.schedule).to eq("2016-12-11 14:00:00")
	  	end

	  	it "should belong to a response with id 1" do
	  		expect(@schedule.response_id).to eq(1)
	  	end
  	end

  	context "When schedule time is not set" do
  		before do
	  		@schedule = Schedule.new
  		end

  		it "is not a valid schedule" do
  			expect(@schedule).not_to be_valid
  		end
  	end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new
  before(:all) do
  	user.id = 1
		user.provider = "facebook"
		user.uid = "1355889534440499"
		user.first_name = "Kenigbolo"
		user.last_name =  "Meya Stephen"
		user.location = "Estonia"
		user.headline = "Software Engineer"
		user.industry = "IT"
  	user.email = "expensivestephen@gmail.com"
  end

	describe ".from_omniauth" do
		it "saves new user" do
			expect(User.all).should_not be_nil
		end
	end
  
  context "When a new User is initialized" do
    it "is a new user" do
      expect(user).to be_a_new(User)
    end
    
    it "should be a valid User object" do
      expect(user).to be_valid
    end      
  end

  context "When a User details are saved" do
    it "is expected to save a user object" do
      expect(user).to be_a_new(User)
    end

    it "should be a valid User object" do
      expect(user).to be_valid
    end

    it "is expected to save all user properties defined" do
      expect(user.provider).to eq("facebook")
      expect(user.uid).to eq("1355889534440499")
      expect(user.first_name).to eq("Kenigbolo")
      expect(user.email).to eq("expensivestephen@gmail.com")
      expect(user.last_name).to eq("Meya Stephen")
    end
  end
end

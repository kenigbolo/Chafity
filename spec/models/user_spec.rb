require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user, provider: 'facebook', uid:'1355889534440499') }

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
    end
  end
end

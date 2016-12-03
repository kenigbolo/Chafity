require 'rails_helper'

RSpec.describe Suggestion, type: :model do
  context "when a suggestion is created" do
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

    suggestion = Suggestion.new(charity_name: 'Test', user_id: user.id)

    it "is a new Suggestion" do
      expect(suggestion).to be_a_new(Suggestion)
    end

    it "should be a valid suggestion object" do
      expect(suggestion).to be_valid
    end

    it "is expected to save suggestion properly" do
      expect(suggestion.charity_name).not_to be_nil
    end

    it 'validates the presence of a charity name' do
      suggestion.charity_name = nil
      expect(suggestion).not_to be_valid
    end

    it 'validates the presence of a user who suggested' do
      suggestion.user_id = nil
      expect(suggestion).not_to be_valid
    end
  end
end

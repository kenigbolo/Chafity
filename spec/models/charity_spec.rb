require 'rails_helper'

RSpec.describe Charity, type: :model do
  context "when a charity is created" do
    let(:charity) { FactoryGirl.build :charity}

    it "is a new charity" do
      expect(charity).to be_a_new(Charity)
    end

    it "should be a valid charity object" do
      expect(charity).to be_valid
    end

    it "is expected to save charity properly" do
      expect(charity.name).not_to be_nil
      expect(charity.address).not_to be_nil
      expect(charity.total_amount).not_to be_nil
      expect(charity.iban).not_to be_nil
      expect(charity.registration_number).not_to be_nil
      expect(charity.country).not_to be_nil
    end
  end

  context "when charity doesnt have required details" do
    before do
      @charity = Charity.new
      @charity.registration_number = "123"
      @charity.country = "Estonia"
      @charity.created_at = "2016-10-25 16:00:00"
      @charity.updated_at=  "2016-10-26 16:00:00"
      @charity.save
    end

    it "is a new charity" do
      expect(@charity).to be_a_new(Charity)
    end

    it "should not be a valid charity object without the details" do
      expect(@charity).not_to be_valid
    end
  end
end

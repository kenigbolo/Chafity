require 'rails_helper'

RSpec.describe Charity, type: :model do


    context "when a charity is created" do

      before do
        @charity = Charity.new
        @charity.id = 1
        @charity.name = "Kevin"
        @charity.address = "Something street"
        @charity.total_amount = "100"
        @charity.iban = "EE34342"
        @charity.registration_number = "123"
        @charity.country = "Estonia"
        @charity.created_at = "2016-10-25 16:00:00"
        @charity.updated_at=  "2016-10-26 16:00:00"
        @charity.user_id = 1
      end


      it "is a new charity" do
        expect(@charity).to be_a_new(Charity)
      end

      it "should be a valid charity object" do
        expect(@charity).to be_valid
      end

      it "is expected to save charity properly" do
        expect(@charity.name).to eq("Kevin")
        expect(@charity.address).to eq("Something street")
        expect(@charity.total_amount).to eq("100")
        expect(@charity.iban).to eq("EE34342")
        expect(@charity.registration_number).to eq("123")
        expect(@charity.country).to eq("Estonia")
        expect(@charity.created_at).to eq("2016-10-25 16:00:00")
        expect(@charity.updated_at).to eq("2016-10-26 16:00:00")
      end

    end

  context "when charity doesnt have name" do
    before do
      @charity = Charity.new
      @charity.address = "Something street"
      @charity.total_amount = "100"
      @charity.iban = "EE34342"
      @charity.registration_number = "123"
      @charity.country = "Estonia"
      @charity.created_at = "2016-10-25 16:00:00"
      @charity.updated_at=  "2016-10-26 16:00:00"
      @charity.user_id = 1
      @charity.save
    end


    it "is a new charity" do
      expect(@charity).to be_a_new(Charity)
    end


    it "should not be a valid charity" do
      expect(@charity).not_to be_valid
    end

  end
  
  context "when charity doesnt have address" do
    before do
      @charity = Charity.new
      @charity.name = "Everybody deserves a name"
      @charity.total_amount = "1000000"
      @charity.iban = "EE34342"
      @charity.registration_number = "123"
      @charity.country = "Estonia"
      @charity.created_at = "2016-10-25 16:00:00"
      @charity.updated_at=  "2016-10-26 16:00:00"
      @charity.user_id = 1
      @charity.save
    end


    it "is a new charity" do
      expect(@charity).to be_a_new(Charity)
    end


    it "should not be a valid charity" do
      expect(@charity).not_to be_valid
    end
  end

  context "when charity doesnt have total_amount" do
    before do
      @charity = Charity.new
      @charity.name = "Everybody deserves a name"
      @charity.address = "We are located somewhere"
      @charity.iban = "EE34342"
      @charity.registration_number = "123"
      @charity.country = "Estonia"
      @charity.created_at = "2016-10-25 16:00:00"
      @charity.updated_at=  "2016-10-26 16:00:00"
      @charity.user_id = 1
      @charity.save
    end


    it "is a new charity" do
      expect(@charity).to be_a_new(Charity)
    end


    it "should not be a valid charity" do
      expect(@charity).not_to be_valid
    end
  end

  context "when charity doesnt have iban" do
    before do
      @charity = Charity.new
      @charity.name = "Everybody deserves a name"
      @charity.address = "We are located somewhere"
      @charity.total_amount = "1000000"
      @charity.registration_number = "123"
      @charity.country = "Estonia"
      @charity.created_at = "2016-10-25 16:00:00"
      @charity.updated_at=  "2016-10-26 16:00:00"
      @charity.user_id = 1
      @charity.save
    end


    it "is a new charity" do
      expect(@charity).to be_a_new(Charity)
    end


    it "should not be a valid charity" do
      expect(@charity).not_to be_valid
    end
  end

  context "when charity doesnt have registration_number" do
    before do
      @charity = Charity.new
      @charity.name = "Everybody deserves a name"
      @charity.address = "We are located somewhere"
      @charity.total_amount = "1000000"
      @charity.iban = "EE34342"
      @charity.country = "Estonia"
      @charity.created_at = "2016-10-25 16:00:00"
      @charity.updated_at=  "2016-10-26 16:00:00"
      @charity.user_id = 1
      @charity.save
    end


    it "is a new charity" do
      expect(@charity).to be_a_new(Charity)
    end


    it "should not be a valid charity" do
      expect(@charity).not_to be_valid
    end
  end

  context "when charity doesnt have country" do
    before do
      @charity = Charity.new
      @charity.name = "Everybody deserves a name"
      @charity.address = "We are located somewhere"
      @charity.total_amount = "1000000"
      @charity.iban = "EE34342"
      @charity.registration_number = "123"
      @charity.created_at = "2016-10-25 16:00:00"
      @charity.updated_at=  "2016-10-26 16:00:00"
      @charity.user_id = 1
      @charity.save
    end


    it "is a new charity" do
      expect(@charity).to be_a_new(Charity)
    end


    it "should not be a valid charity" do
      expect(@charity).not_to be_valid
    end
  end

end

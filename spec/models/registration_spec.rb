require 'spec_helper'

describe 'Create a user' do

  it 'should create a user with first name and last name ' do
    @user = build(:user)
    expect(@user.first_name).to eq("#{@user.first_name}")
    expect(@user.last_name).to eq("#{@user.last_name}")
  end
end
require 'spec_helper'

describe 'Create a user' do

  it 'should create a user with first name and last name ' do
    @user = User.new
    @user.first_name = 'Fortunat'
    @user.last_name = 'Mutunda'

    expect(@user.first_name).to eq('Fortunat')
    expect(@user.last_name).to eq('Mutunda')

  end
end
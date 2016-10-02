require 'rails_helper'

describe "POST sign_up" do

  it 'create a new @user' do
    user = build(:user)
    post :user_registration_path
  end

end
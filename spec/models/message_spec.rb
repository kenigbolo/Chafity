require 'rails_helper'

RSpec.describe Message, type: :model do

  describe "Some stuff do" do
    before" "do
      @user = create(:user)
      @message = @user.messages.new(message_body: 'Hello')
    end

    it "Should create a right message" do
      puts @message.inspect
      expect(@message.message_body).to eq("Hello")
      expect(@message.user_id).to eq(@user.id)
    end
  end
end

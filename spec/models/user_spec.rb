require 'rails_helper'

RSpec.describe User, type: :model do
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

    describe '.from_omniauth' do
        it 'saves new user' do
            expect(User.all).should_not be_nil
        end
    end

    context 'When a new User is initialized' do
        it 'is a new user' do
            expect(user).to be_a_new(User)
        end

        it 'should be a valid User object' do
            expect(user).to be_valid
        end
    end

    context 'When a User details are saved' do
        it 'is expected to save a user object' do
            expect(user).to be_a_new(User)
        end

        it 'should be a valid User object' do
            expect(user).to be_valid
        end

        it 'is expected to save all user properties defined' do
            expect(user.provider).to eq('facebook')
            expect(user.uid).to eq('1355889534440499')
            expect(user.first_name).to eq('Kenigbolo')
            expect(user.email).to eq('expensivestephen@gmail.com')
            expect(user.last_name).to eq('Meya Stephen')
        end
    end

    context 'When new user is registered using omniauth' do
        before do
            OmniAuth.config.test_mode = true
            OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new({
                :provider => 'linkedin',
                :uid => '1234',
                :info =>  {
                    :first_name => 'Nameman',
                    :last_name => 'Namingson',
                    :location => 'China',
                    :headline => 'qwertwert',
                    :industry => 'Education',
                    :email => 'nameman@emails.cn',
                    :description => 'describing things'
                }
            })
            Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:linkedin]
            @user = User.from_omniauth(Rails.application.env_config["omniauth.auth"])
        end

        after do
            OmniAuth.config.mock_auth[:linkedin] = nil
        end

        it 'is a valid user' do
            expect(@user).to be_valid
        end

        it 'should have correct details' do
            expect(@user.provider).to eq('linkedin')
            expect(@user.first_name).to eq('Nameman')
            expect(@user.last_name).to eq('Namingson')
            expect(@user.location).to eq('China')
            expect(@user.headline).to eq('qwertwert')
            expect(@user.industry).to eq('Education')
            expect(@user.email).to eq('nameman@emails.cn')
            expect(@user.description). to eq('describing things')
        end

    end
end

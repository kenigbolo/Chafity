require 'factory_girl'

10.times do
  user = FactoryGirl.create(:user)
  charity = FactoryGirl.create(:charity, user_id: user.id)
end
puts 'successful seed'

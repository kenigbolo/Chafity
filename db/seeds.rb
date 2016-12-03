require 'factory_girl'

10.times do
  charity = FactoryGirl.create(:charity)
  user = FactoryGirl.create(:user, charity_id: charity.id)
end
puts 'successful seed'
# end

# if ENV['RAILS_ENV'] = 'production'
#     Charity.create(id: 1, name: 'Golden Minds', address: 'W.Struve 1, Tartu', total_amount: 15_243,
#                    iban: 'EE26819173836287161', registration_number: 'U78GH897XC', country: 'Estonia')
# else

require 'factory_girl'
# User.create! id: 5, email: "fotimutunda@hotmail.com", password:'123456', created_at: "2016-09-25 00:12:59", updated_at: "2016-09-25 00:14:28", provider: nil, uid: nil, first_name: "Fortunat", last_name: "Lufunda", location: nil, headline: nil, description: nil, image: nil, phone: nil, industry: nil
# User.create! id: 6, email: "batman@batman.com", password:'123456', created_at: "#{Time.now}", updated_at: "#{Time.now + 1.day}", provider: nil, uid: nil, first_name: "Bat", last_name: "Man", location: nil, headline: nil, description: nil, image: nil, phone: nil, industry: nil
# User.create! id: 7, email: "robbin@batman.com", password:'123456', created_at: "#{Time.now}", updated_at: "#{Time.now + 1.day}", provider: nil, uid: nil, first_name: "Rob", last_name: "bin", location: nil, headline: nil, description: nil, image: nil, phone: nil, industry: nil

# 10.times do
#   user = FactoryGirl.build(:user)
# end
#
# user_id = Random.rand(1..10)
# User.create! email: user.email , password: user.password,first_name: user.first_name, last_name: user.last_name,
#              location: user.location, headline: user.headline, description: user.description, image: user.image,
#              industry: user.industry

# charity = FactoryGirl.build(:charity)
# Charity.create! name: charity.name, address: charity.address, total_amount: charity.total_amount,
#                 iban: charity.iban, registration_number: charity.registration_number, country: charity.country , user_id: user_id


# message = FactoryGirl.build(:message)
# Message.create!  created_at: message.created_at, updated_ad: message.updated_at, sender_id: message.sender_id,
#                  receiver_id: message.receiver_id, message_body: message.message_body, appointment_date: message.appointment_date,
#                  user_id: message.user_id
10.times do
  user = FactoryGirl.create(:user)
  charity = FactoryGirl.create(:charity, user_id: user.id)
end
puts 'successful seed'
# end

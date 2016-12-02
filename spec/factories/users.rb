FactoryGirl.define do
  factory :user do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    location {Faker::Address.city}
    headline {Faker::ChuckNorris.fact}
    description {Faker::Hipster.paragraph}
    image {Faker::Placeholdit.image("80x80")}
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    industry {Faker::Company.name}
    confirmed_at { Time.now + 5.seconds }
  end
end

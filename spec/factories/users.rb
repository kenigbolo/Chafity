FactoryGirl.define do
  factory :user do |f|
    f.first_name {Faker::Name.first_name}
    f.last_name {Faker::Name.last_name}
    f.location {Faker::Address.city}
    f.headline {Faker::ChuckNorris.fact}
    f.description {Faker::Hipster.paragraph}
    f.image {Faker::Placeholdit.image("80x80")}
    f.email {Faker::Internet.email}
    f.password {Faker::Internet.password}
    f.industry {Faker::Company.name}
  end
end
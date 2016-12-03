FactoryGirl.define do
  factory :suggestion do
    charity_name {Faker::Company.name}
    user
  end
end

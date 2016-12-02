FactoryGirl.define do
  factory :charity do
    name {Faker::Company.name}
    address {Faker::Address.city_prefix}
    total_amount {Faker::Commerce.price}
    iban {Faker::Number.number(10)}
    registration_number {Faker::Number.hexadecimal(10)}
    country {Faker::Address.country}
  end
end

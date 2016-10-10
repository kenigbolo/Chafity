FactoryGirl.define do
  factory :charity do |f|
    f.name {Faker::Company.name}
    f.address {Faker::Address.city_prefix}
    f.total_amount {Faker::Commerce.price}
    f.iban {Faker::Number.number(10)}
    f.registration_number {Faker::Number.hexadecimal(10)}
    f.country {Faker::Address.country}
  end
end
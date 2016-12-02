FactoryGirl.define do
  factory :payment do
    payment_status {Faker::Hacker.verb}
    transaction_id {Faker::Crypto.md5}
    payment_number {Faker::Crypto.md5}
    payee_id {Faker::Number.between(1, 10)}
    user
  end
end

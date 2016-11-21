FactoryGirl.define do
  factory :payment do
    user nil
    status "MyString"
    transaction_id "MyString"
    message ""
  end
end

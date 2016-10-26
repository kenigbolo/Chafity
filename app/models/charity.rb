class Charity < ApplicationRecord
  has_many :users
  validates :name, :address, :total_amount, :iban, :registration_number, :country ,presence: true
end

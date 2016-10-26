class Charity < ApplicationRecord
  has_many :users
  validates :name, presence: true
  validates :address, presence: true
  validates :total_amount, presence: true
  validates :iban, presence: true
  validates :registration_number, presence: true
  validates :country, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
  validates :user_id, presence: true
end
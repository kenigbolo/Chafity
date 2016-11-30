class Charity < ApplicationRecord
  belongs_to :users

  validates :name,
            :address,
            :total_amount,
            :iban,
            :registration_number,
            :country,
            :user_id, presence: true
end
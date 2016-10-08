class Message < ApplicationRecord

  belongs_to :user,  inverse_of: :messages
  accepts_nested_attributes_for :user
  validates :sender_id,:receiver_id,:message_body,:appointment_date, presence: true

end

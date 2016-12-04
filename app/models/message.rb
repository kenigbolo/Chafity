class Message < ApplicationRecord

  belongs_to :user,  inverse_of: :messages
  has_many :responses
  accepts_nested_attributes_for :user
  validates :sender_id,:receiver_id,:message_body, presence: true
  # validates :appointment_date, presence: true ,on: :update

  def reciever
    User.find(self.receiver_id)
  end

end

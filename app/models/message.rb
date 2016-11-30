class Message < ApplicationRecord

  belongs_to :user,  inverse_of: :messages
  has_many :responses
  accepts_nested_attributes_for :user
  validates :sender_id,:receiver_id,:message_body,:appointment_date, presence: true

  def reciever_name!
    User.find_by(id: self.receiver_id).to_s
  end

end

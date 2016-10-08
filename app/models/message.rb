class Message < ApplicationRecord

  belongs_to :user,  inverse_of: :messages
  accepts_nested_attributes_for :user



end

class Payment < ApplicationRecord
  belongs_to :user

  def to_contact
    User.find_by_id(self.payee_id)
  end
end

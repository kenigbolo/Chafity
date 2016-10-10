class AddUsereReferenceToCharity < ActiveRecord::Migration[5.0]
  def change
    add_reference :charities, :user, foreign_key: true
  end
end

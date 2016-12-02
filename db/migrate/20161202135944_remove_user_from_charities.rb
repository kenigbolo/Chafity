class RemoveUserFromCharities < ActiveRecord::Migration[5.0]
  def change
    remove_reference :charities, :user, foreign_key: true
  end
end

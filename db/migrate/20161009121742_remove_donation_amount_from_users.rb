class RemoveDonationAmountFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :donation_amount, :decimal
  end
end

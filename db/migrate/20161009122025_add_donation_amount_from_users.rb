class AddDonationAmountFromUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :donation_amount, :decimal, :default => 5.0
  end
end

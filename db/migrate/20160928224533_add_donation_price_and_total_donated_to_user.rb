class AddDonationPriceAndTotalDonatedToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :donation_amount, :decimal , default: 0.0
    add_column :users, :total_donated, :decimal , default: 0.0
  end
end

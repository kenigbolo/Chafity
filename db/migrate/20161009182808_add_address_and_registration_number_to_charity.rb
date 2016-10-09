class AddAddressAndRegistrationNumberToCharity < ActiveRecord::Migration[5.0]
  def change
    add_column :charities, :address, :string
    add_column :charities, :registration_number, :string
  end
end

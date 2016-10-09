class CreateCharities < ActiveRecord::Migration[5.0]
  def change
    create_table :charities do |t|
      t.string :name
      t.string :address
      t.string :total_amount
      t.string :iban
      t.string :registration_number
      t.string :country

      t.timestamps
    end
  end
end

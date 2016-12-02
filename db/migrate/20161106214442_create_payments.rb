class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.string :payment_number, null: false
      t.string :payment_status, null: false
      t.string :transaction_id, null: false
      t.integer :payee_id, null: false

      t.timestamps
    end
  end
end

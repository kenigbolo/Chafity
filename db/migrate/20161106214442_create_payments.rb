class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.string :status, null: false
      t.string :transaction_id, null: false
      t.integer :message, null: false

      t.timestamps
    end
  end
end

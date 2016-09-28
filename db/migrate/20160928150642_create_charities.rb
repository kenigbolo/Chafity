class CreateCharities < ActiveRecord::Migration[5.0]
  def change
    create_table :charities do |t|
      t.string :name
      t.decimal :minimum_amount
      t.decimal :total_amount

      t.timestamps
    end
  end
end

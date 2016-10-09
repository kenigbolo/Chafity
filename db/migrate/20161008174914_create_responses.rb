class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.text :body
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.string :charity_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

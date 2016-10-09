class AddColunmnsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :sender_id, :string
    add_column :messages, :receiver_id, :string
    add_column :messages, :message_body, :string
    add_column :messages, :status, :string
    add_column :messages, :appointment_date, :datetime
    add_index :messages, :appointment_date
  end
end

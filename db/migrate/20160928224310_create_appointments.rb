class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :message_body
      t.string :message_status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

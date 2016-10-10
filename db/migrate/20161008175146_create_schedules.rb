class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.datetime :schedule
      t.references :response, foreign_key: true

      t.timestamps
    end
  end
end

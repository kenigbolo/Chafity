class RemoveTableChickens < ActiveRecord::Migration[5.0]
  def change
    drop_table :chickens
    drop_table :appointments
  end
end

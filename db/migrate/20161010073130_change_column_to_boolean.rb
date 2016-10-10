class ChangeColumnToBoolean < ActiveRecord::Migration[5.0]
  def change
    change_column :messages, :status, 'boolean USING CAST(status AS boolean)'
  end
end
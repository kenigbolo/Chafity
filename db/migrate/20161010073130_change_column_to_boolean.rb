class ChangeColumnToBoolean < ActiveRecord::Migration[5.0]
  def change
  	if ActiveRecord::Base.connection.adapter_name == 'postgresql'
    	change_column :messages, :status, 'boolean USING CAST(status AS boolean)'
    else
    	change_column :messages, :status, :boolean
    end
  end
end
class ModifyStatusTypeFromMessages < ActiveRecord::Migration[5.0]
  def change
    change_column :messages, :status, :boolean
  end
end

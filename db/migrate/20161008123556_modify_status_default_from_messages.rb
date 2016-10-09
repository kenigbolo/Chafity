class ModifyStatusDefaultFromMessages < ActiveRecord::Migration[5.0]
  def change
    change_column_default :messages, :status, false
  end
end

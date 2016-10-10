class AddCharityRefrencesToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :charity, foreign_key: true
  end
end

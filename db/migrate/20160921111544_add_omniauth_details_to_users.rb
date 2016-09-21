class AddOmniauthDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
    add_column :users, :headline, :string
    add_column :users, :description, :string
    add_column :users, :image, :string
    add_column :users, :phone, :string
    add_column :users, :industry, :string
  end
end

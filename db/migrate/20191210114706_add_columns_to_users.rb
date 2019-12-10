class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :wallet, :integer
    add_column :users, :location, :string
    add_column :users, :psn, :string
    add_column :users, :xboxlive, :string
  end
end

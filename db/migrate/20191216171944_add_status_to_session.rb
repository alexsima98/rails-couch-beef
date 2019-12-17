class AddStatusToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :status, default:"pending"
  end
end

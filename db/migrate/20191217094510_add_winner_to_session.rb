class AddWinnerToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :winner, :string
  end
end

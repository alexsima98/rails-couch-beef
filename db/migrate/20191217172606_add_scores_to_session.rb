class AddScoresToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :score1, :integer, default: 0
    add_column :sessions, :score2, :integer, default: 0
  end
end

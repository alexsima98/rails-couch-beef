class AddScoresToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :scoreOne, :integer, default: 0
    add_column :sessions, :scoreTwo, :integer, default: 0
  end
end

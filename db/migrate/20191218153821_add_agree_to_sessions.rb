class AddAgreeToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :scoresub, :string
  end
end

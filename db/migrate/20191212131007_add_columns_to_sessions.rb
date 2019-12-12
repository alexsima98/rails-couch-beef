class AddColumnsToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :star_level, :string
    add_column :sessions, :team_type, :string
    add_column :sessions, :half_length, :string
    add_column :sessions, :legacy_depending, :string
    add_column :sessions, :custom_rules, :text
  end
end

class AddColumnsToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :star_level, :string, default: 'Any'
    add_column :sessions, :team_type, :string, default: 'Any'
    add_column :sessions, :half_length, :string, default: '6 min'
    add_column :sessions, :legacy_depending, :string, default: 'Not allowed'
  add_column :sessions, :custom_rules, :text, default: ""
  end
end

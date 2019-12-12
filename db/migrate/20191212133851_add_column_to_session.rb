class AddColumnToSession < ActiveRecord::Migration[5.2]
  def change
        add_column :sessions, :match_type, :string
  end
end

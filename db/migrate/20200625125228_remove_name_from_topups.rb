class RemoveNameFromTopups < ActiveRecord::Migration[5.2]
  def change
    remove_column :topups, :name
  end
end

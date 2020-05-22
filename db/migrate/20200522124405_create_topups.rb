class CreateTopups < ActiveRecord::Migration[5.2]
  def change
    create_table :topups do |t|
      t.string :name

      t.timestamps
    end
  end
end

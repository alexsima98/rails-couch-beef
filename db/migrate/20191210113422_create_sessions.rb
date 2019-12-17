class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :lobby, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :price
      t.integer :win_price, default: 0
      t.string :platform

      t.timestamps
    end
  end
end

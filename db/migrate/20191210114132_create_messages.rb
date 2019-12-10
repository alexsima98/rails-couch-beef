class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :messageble, polymorphic: true
      t.references :user, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end

class CreateUserLobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_lobbies do |t|
      t.references :user, foreign_key: true
      t.references :lobby, foreign_key: true

      t.timestamps
    end
  end
end

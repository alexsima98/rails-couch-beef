class CreateUserInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :user_invites do |t|
      t.references :user, foreign_key: true
      t.references :session, foreign_key: true

      t.timestamps
    end
  end
end

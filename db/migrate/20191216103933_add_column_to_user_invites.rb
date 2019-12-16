class AddColumnToUserInvites < ActiveRecord::Migration[5.2]
  def change
        add_column :user_invites, :friend_added, :string

  end
end

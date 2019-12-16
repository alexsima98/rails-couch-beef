class AddStatusToUserInvites < ActiveRecord::Migration[5.2]
  def change
    add_column :user_invites, :status, :string, default: 'Pending'
  end
end

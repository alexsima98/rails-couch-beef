class AddPhotoToLobby < ActiveRecord::Migration[5.2]
  def change
    add_column :lobbies, :photo, :string
  end
end

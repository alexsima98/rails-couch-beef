class Lobby < ApplicationRecord
  has_many :messages, as: :messageable
  has_many :user_lobbies
  has_many :users, through: :user_lobbies
  has_many :sessions

  validates :title, presence: true
end

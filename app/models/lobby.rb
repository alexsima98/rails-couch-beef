class Lobby < ApplicationRecord
  has_many :messages, as: :messageable
  has_many :user_lobbies
  has_many :users, through: :user_lobbies
  has_many :sessions

  # this validation is ok, but you can add more
  # Also all the models should have more validations
  validates :title, presence: true
end

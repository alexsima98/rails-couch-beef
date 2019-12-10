class Lobby < ApplicationRecord
  has_many :messages, as: :messageable
end

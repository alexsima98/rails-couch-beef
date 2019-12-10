class Session < ApplicationRecord
  belongs_to :lobby
  belongs_to :user
  has_many :messages, as: :messageable
end

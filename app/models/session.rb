class Session < ApplicationRecord
  belongs_to :lobby
  belongs_to :user
  has_many :messages
  has_many :user_invites
  has_many :users, through: :user_invites

  validates :price, presence: true
  validates :platform, presence: true
end

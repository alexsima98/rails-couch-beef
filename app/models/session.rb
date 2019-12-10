class Session < ApplicationRecord
  belongs_to :lobby
  belongs_to :user
  has_many :messages, as: :messageable
  has_many :user_invites
  has_many :users, through: :user_invites

validates :enter_price, presence: true
validates :winning_price, presence: true
validates :platform, presence: true


end

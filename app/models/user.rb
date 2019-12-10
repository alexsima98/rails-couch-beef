class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :user_lobbies
  has_many :lobbies, through: :user_lobbies
  has_many :user_invites
  has_many :sessions

  validates :username, presence: true, uniqueness: true
  validates :xboxlive, uniqueness: true
  validates :psn, uniqueness: true
end

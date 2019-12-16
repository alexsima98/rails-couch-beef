class Session < ApplicationRecord
  belongs_to :lobby
  belongs_to :user
  has_many :messages
  has_many :user_invites
  has_many :users, through: :user_invites

  validates :price, presence: true
  validates :platform, presence: true

  def self.defaultrules
    {
     star_level:"Any",
     team_type:"Any",
     half_length:"6 min",
     legacy_depending:"Not allowed",
     custom_rules:"",
     match_type:"Single game"
    }
  end

  def customrules?
    attributes.any? do |key, value|
      self.class.defaultrules[key] != value
    end
  end
end


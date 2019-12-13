class Message < ApplicationRecord
  belongs_to :session
  belongs_to :user

  validates :content, presence: true
  validates :user, presence: true
end

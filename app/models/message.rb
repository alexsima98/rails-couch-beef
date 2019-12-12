class Message < ApplicationRecord
  belongs_to :messageble, polymorphic: true
  belongs_to :user

  validates :content, presence: true
  validates :user, presence: true


end

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :topup

  monetize :amount_cents

end

class AddPriceToMoneys < ActiveRecord::Migration[5.2]
  def change
    add_monetize :money, :price, currency: { present: false }

  end
end

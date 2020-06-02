class AddPriceToMoneys < ActiveRecord::Migration[5.2]
  def change
    create_table :moneys
    add_monetize :moneys, :price, currency: { present: false }

  end
end

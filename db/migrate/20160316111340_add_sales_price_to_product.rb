class AddSalesPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :old_price, :float
  end
end

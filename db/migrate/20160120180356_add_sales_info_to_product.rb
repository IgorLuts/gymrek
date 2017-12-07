class AddSalesInfoToProduct < ActiveRecord::Migration
  def change
    add_column :products, :sales_info, :string
  end
end

class AddAvailableToProduct < ActiveRecord::Migration
  def change
    add_column :products, :available, :boolean, default: true
    add_column :products, :feature, :string
  end
end

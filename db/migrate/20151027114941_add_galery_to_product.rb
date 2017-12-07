class AddGaleryToProduct < ActiveRecord::Migration
  def change
    add_column :products, :gallery, :json
  end
end

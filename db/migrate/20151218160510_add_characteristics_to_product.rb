class AddCharacteristicsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :characteristics, :string
  end
end

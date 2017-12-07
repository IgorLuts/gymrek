class AddSlugToProduct < ActiveRecord::Migration
  def change
    add_column :products, :slug, :string
    add_index :products, :slug, unique: true
    add_column :categories, :slug, :string
    add_index :categories, :slug, unique: true
  end
end

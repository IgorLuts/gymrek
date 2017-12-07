class AddAncestryToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :ancestry, :string
    add_index :categories, :ancestry
    add_column :categories, :position, :integer
  end
end

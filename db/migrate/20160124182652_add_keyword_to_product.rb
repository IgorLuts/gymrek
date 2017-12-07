class AddKeywordToProduct < ActiveRecord::Migration
  def change
    add_column :products, :keywords, :string
    add_column :articles, :keywords, :string
    add_column :categories, :keywords, :string
  end
end

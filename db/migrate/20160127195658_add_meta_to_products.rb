class AddMetaToProducts < ActiveRecord::Migration
  def change
    add_column :products, :meta_title, :string
    add_column :products, :meta_description, :string
    add_column :products, :meta_keywords, :string

    add_column :articles, :meta_title, :string
    add_column :articles, :meta_description, :string
    add_column :articles, :meta_keywords, :string

    add_column :categories, :meta_title, :string
    add_column :categories, :meta_description, :string
    add_column :categories, :meta_keywords, :string

    remove_column :products, :keywords, :string
    remove_column :articles, :keywords, :string
    remove_column :categories, :keywords, :string
  end
end

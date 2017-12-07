class AddMetaToPage < ActiveRecord::Migration
  def change
    add_column :pages, :meta_title, :string
    add_column :pages, :meta_description, :string
    add_column :pages, :meta_keywords, :string
  end
end

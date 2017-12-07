class AddCustomStyleToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :custom_style, :string
  end
end

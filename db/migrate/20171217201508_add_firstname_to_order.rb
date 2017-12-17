class AddFirstnameToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :firstname, :string
    add_column :orders, :lastname, :string
    add_column :orders, :post_code, :string

    remove_column :orders, :name, :string
  end
end

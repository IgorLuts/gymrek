class ShoppingCartItem < ActiveRecord::Base
  acts_as_shopping_cart_item
  belongs_to :order
end

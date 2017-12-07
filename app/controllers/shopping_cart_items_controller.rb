class ShoppingCartItemsController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def create
    @product = Product.find(params[:product_id])
    if params[:shopping_cart_item]
      @quantity = params[:shopping_cart_item][:quantity].to_i
      @shopping_cart.add(@product, @product.price, @quantity)
    else
      @shopping_cart.add(@product, @product.price)
    end
    redirect_to shopping_cart_path
  end

  def destroy
    @item = Product.find(params[:product_id])
    @shopping_cart.remove(@item)
    redirect_to shopping_cart_path
  end
end

class ShoppingCartsController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def show
  end

  def destroy
    @shopping_cart.clear
    redirect_to root_path
  end
end

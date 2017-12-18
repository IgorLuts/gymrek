class StoreController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def index
      @popular_products = Product.popular.limit(6)
      @novinki = Product.novinki.limit(6)
  end
end

class StoreController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def index
    @popular_products = Product.limit(6)
    @novinki = Product.where.not(id: @popular_products.ids).order(:updated_at).limit(6)
  end
end

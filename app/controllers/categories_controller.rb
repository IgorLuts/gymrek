class CategoriesController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def show
    @category = Category.friendly.find(params[:id])
    @products = ChildrenCategoryProducts.new(@category).products.page(params[:page])
    if request.path != category_path(@category)
      redirect_to category_path(@category), status: :moved_permanently
    end
  end
end

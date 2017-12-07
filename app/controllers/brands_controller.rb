class BrandsController < ApplicationController
  before_action :find_categories

  def show
    @brand = Brand.includes(:products).friendly.find(params[:id])
    @products = @brand.products.page(params[:page])
    if request.path != brand_path(@brand)
      redirect_to brand_path(@brand), status: :moved_permanently
    end
  end
end

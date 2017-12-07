class PagesController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def show
    @page = Page.friendly.find(params[:id])
  end
end

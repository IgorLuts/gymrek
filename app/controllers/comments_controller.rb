class CommentsController < ApplicationController
  before_action :set_product
  before_action :find_categories

  def create
    @comment = @product.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to product_path(@product) }
        format.js
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:user_name, :body)
  end
end

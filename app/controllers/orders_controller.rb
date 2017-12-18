class OrdersController < ApplicationController
  before_action :set_cart
  before_action :find_categories
  before_action :load_order, only: :show

  authorize_resource only: [:index, :show]

  def index
    @orders = current_user.orders
  end

  def show
  end

  def new
    if @shopping_cart.empty?
      redirect_to root_path, notice: "Ваша корзина пустая"
      return
    end

    @order = Order.new
  end

  def create
    return if @shopping_cart.empty?
    @order = Order.new(order_params.merge(user: current_user))
    @order.add_line_items_from_cart(@shopping_cart)
    @order.add_total_price(@shopping_cart)

    respond_to do |format|
      if @order.save
        UserMailer.order_notification(@order).deliver_later
        ShoppingCart.destroy(session[:shopping_cart_id])
        session[:shopping_cart_id] = nil
        format.html { redirect_to root_path, notice: 'Your order was successfully decorated.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def load_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:firstname, :lastname, :post_code, :adress, :email, :phone, :comment)
  end
end

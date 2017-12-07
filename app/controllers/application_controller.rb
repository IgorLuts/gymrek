class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :find_categories, :set_cart, if: :devise_controller?
  # before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :category_path

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:password, :password_confirmation, :current_password)
    end
  end

  def find_categories
    @categories = Rails.cache.fetch('global/categories', expires_in: 10.minutes) do
      Category.where(active: true).arrange
    end
  end

  def set_cart
    shopping_cart_id = session[:shopping_cart_id]
    @shopping_cart = session[:shopping_cart_id] ? ShoppingCart.find(shopping_cart_id) : ShoppingCart.create
    session[:shopping_cart_id] = @shopping_cart.id
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def category_path(category)
    if category.is_root?
      category_short_path category
    else
      category_long_path category.parent, category
    end
  end
end

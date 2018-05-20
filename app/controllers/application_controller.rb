class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :find_categories, :set_cart, if: :devise_controller?
  before_action :set_locale

  helper_method :category_path

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:password, :password_confirmation, :current_password)
    end
  end

  def find_categories
    @categories = Category.where(active: true).arrange
  end

  def set_cart
    shopping_cart_id = session[:shopping_cart_id]
    @shopping_cart = session[:shopping_cart_id] ? ShoppingCart.find(shopping_cart_id) : ShoppingCart.create
    session[:shopping_cart_id] = @shopping_cart.id
  end

  def category_path(category)
    if category.is_root?
      category_short_path category
    else
      category_long_path category.parent, category
    end
  end

  def set_locale
    logger.debug "setting locale #{request.location.country_code}"
    I18n.locale = :nl
  end
#   def set_locale
#     if cookies[:locale] && I18n.available_locales.include?(cookies[:locale].to_sym)
#       l = cookies[:locale].to_sym
#     else
#       begin
#         if country_code = request.location.country_code
#           logger.debug "setting locale #{country_code}"
#           l = [:be, :bel].include?(country_code.downcase.to_sym) ? :nl : I18n.default_locale
#         end
#       rescue
#         l = I18n.default_locale
#       ensure
#         cookies.permanent[:locale] = l
#       end
#     end
#     I18n.locale = l
#   end
# end

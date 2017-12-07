class ErrorsController < ApplicationController
  before_action :set_cart
  before_action :find_categories

  def not_found
    render(:status => 404)
  end

  def internal_server_error
    render(:status => 500)
  end
end

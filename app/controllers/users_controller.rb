class UsersController < ApplicationController
  before_action :set_cart
  before_action :find_categories
  
  def show
    @user = User.find(params[:id])
  end
end

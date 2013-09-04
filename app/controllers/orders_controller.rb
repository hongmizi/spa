class OrdersController < ApplicationController
  before_filter :load_cart, only: [:new]

  def new
  end

  def create
  end

  def show
  end

  private
  def load_cart
    @cart = Cart.find_by_id session[:cart]
    return redirect_to home_path if @cart.nil?
  end
end

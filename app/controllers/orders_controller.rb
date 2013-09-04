class OrdersController < ApplicationController
  before_filter :load_cart, only: [:new, :create]

  def new
  end

  def create
    order = Order.new
    @cart.line_items.each do |line_item|
      order.line_items << line_item
    end

    if order.save
      @cart.checkout
      return redirect_to root_path, notice: "successful"
    else
      return redirect_to root_path, alert: order.errors.full_messages.to_sentence
    end
  end

  def show
  end

  private
  def load_cart
    @cart = Cart.find_by_id session[:cart]

    @cart =  Cart.shopping.find_by_id session[:cart]
    if @cart.nil? || @cart.completed?
      return redirect_to root_path, alert: "cart is blank" if @cart.nil?
    end
  end
end

class OrdersController < ApplicationController
  before_filter :load_cart, only: [:new, :create]

  def new
  end

  def create
    order = Order.new params[:order]

    @cart.line_items.each do |line_item|
      order.line_items << line_item
    end

    if order.save
      session[:order_id] = order.id
      return redirect_to checkout_path
    else
      return redirect_to root_path, alert: order.errors.full_messages.to_sentence
    end
  end

  def show
  end

  private
  def load_cart
    @cart =  Cart.shopping.find_by_id session[:cart]
    if @cart.nil?
      return redirect_to root_path, alert: "cart is blank" if @cart.nil?
    end
  end
end

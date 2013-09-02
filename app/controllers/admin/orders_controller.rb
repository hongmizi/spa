class Admin::OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_is_admin

  def index
    @orders = Order.all
  end

  def new
  end

  def create
    order  = Order.new params[:order]

    if order.save
      return redirect_to admin_orders_path, alert: "successful"
    else
      return redirect_to admin_orders_path, alert: order.errors.full_messages.to_sentence
    end
  end

  def show
    @order = Order.find params[:id]
  end

  def update
    @order = Order.find params[:id]
    if @order.update_attributes params[:order]
      return redirect_to admin_orders_path, alert: "successful"
    else
      return redirect_to admin_orders_path, alert: @order.errors.full_messages.to_sentence
    end
  end

  def destroy
    order = Order.find params[:id]
    if order.destroy
      return redirect_to admin_orders_path, alert: "successful"
    else
      return redirect_to admin_orders_path, alert: order.errors.full_messages.to_sentence
    end
  end

  private
  def ensure_is_admin
    if !current_user.has_role? :admin
      return redirect_to root_path, alert: "You don't have permission."
    end
  end
end

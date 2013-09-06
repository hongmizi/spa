class Admin::OrdersController < Admin::BaseController
  before_filter :authenticate_user!
  before_filter :ensure_is_admin

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find params[:id]
  end

  def update
    @order = Order.find params[:id]
    if @order.update_attributes params[:order], without_protection: true
      return redirect_to admin_orders_path, notice: "successful"
    else
      return redirect_to admin_orders_path, alert: @order.errors.full_messages.to_sentence
    end
  end

  def destroy
    order = Order.find params[:id]
    if order.destroy
      return redirect_to admin_orders_path, notice: "successful"
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

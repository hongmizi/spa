class Admin::ProductsController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :ensure_is_admin

  def index
    @products = Product.all
  end

  def new
  end

  def create
    product  = Product.new params[:product]

    if product.save
      return redirect_to admin_products_path, alert: "successful"
    else
      return redirect_to admin_products_path, alert: product.errors.full_messages.to_sentence
    end
  end

  def show
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    if @product.update_attributes params[:product]
      return redirect_to admin_products_path, alert: "successful"
    else
      return redirect_to admin_products_path, alert: @product.errors.full_messages.to_sentence
    end
  end

  def destroy
    product = Product.find params[:id]
    if product.destroy
      return redirect_to admin_products_path, alert: "successful"
    else
      return redirect_to admin_products_path, alert: product.errors.full_messages.to_sentence
    end
  end

  private
  def ensure_is_admin
    if !current_user.has_role? :admin
      return redirect_to root_path, alert: "You don't have permission."
    end
  end
end

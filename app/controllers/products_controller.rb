class ProductsController < ApplicationController
  def index
    @products = Product.shelved
  end

  def show
    @product = Product.find(params[:id])
  end
end

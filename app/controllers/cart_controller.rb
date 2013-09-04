class CartController < ApplicationController
  before_filter :load_cart

  def show
  end

  def add_product
    line_item = @cart.line_items.find_by_listing_id params[:listing]
    if line_item
      line_item.quantity = line_item.quantity + 1
    else
      listing = Listing.find params[:listing]
      line_item = @cart.line_items.new listing_id: listing.id, quantity: 1, price: listing.price
    end

    if line_item.save
      return redirect_to :back, notice: "successful"
    else
      return redirect_to :back, alert: "failed"
    end
  end

  def remove_product
    line_item = @cart.line_items.find params[:line_item]
    if line_item.destroy
      return redirect_to :back, notice: "successful"
    else
      return redirect_to :back, alert: "failed"
    end
  end

  def update
  end


  private
  def load_cart
    @cart =  Cart.shopping.find_by_id session[:cart]
    @cart ||= Cart.create
    session[:cart] = @cart.id
  end
end

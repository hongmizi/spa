class Admin::ListingsController < Admin::BaseController
  layout "admin"
  before_filter :load_purchasable, only: [:index]

  def index
    @listings = @purchasable.listings
  end

  def edit
    @listing = Listing.find params[:id]
  end

  def update
    @listing = Listing.find params[:id]

    if @listing.update_attributes params[:listing]
      return redirect_to admin_listings_path(purchasable_id: @listing.purchasable_id, purchasable_type: @listing.purchasable_type), notice: "successful"
    else
      return redirect_to :back, alert: @listing.errors.full_messages.to_sentence
    end

  end

  def destroy
    listing = Listing.find params[:id]

    if listing.destroy
      return redirect_to :back, notice: "successful"
    else
      return redirect_to :back, alert: listing.errors.full_messages.to_sentence
    end
  end

  private
    def load_purchasable
      @purchasable = params[:purchasable_type].constantize.find params[:purchasable_id]
    end
end

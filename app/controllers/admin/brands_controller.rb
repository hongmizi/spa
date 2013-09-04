class Admin::BrandsController < Admin::BaseController
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find params[:id]
  end

  def new
  end

  def create
    brand  = Brand.new params[:brand]

    if brand.save
      return redirect_to admin_brands_path, alert: "successful"
    else
      return redirect_to admin_brands_path, alert: brand.errors.full_messages.to_sentence
    end
  end

  def update
    @brand = Brand.find params[:id]
    if @brand.update_attributes params[:brand]
      return redirect_to admin_brands_path, alert: "successful"
    else
      return redirect_to admin_brands_path, alert: @brand.errors.full_messages.to_sentence
    end
  end

  def destroy
    brand = Brand.find params[:id]
    if brand.destroy
      return redirect_to admin_brands_path, alert: "successful"
    else
      return redirect_to admin_brands_path, alert: brand.errors.full_messages.to_sentence
    end
  end
end

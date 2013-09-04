class Admin::CosmeticsController < Admin::BaseController
  layout "admin"

  def index
    @cosmetics = Cosmetic.all
  end

  def new
    @cosmetic = Cosmetic.new
  end

  def edit
    @cosmetic = Cosmetic.find params[:id]
  end

  def create
    cosmetic  = Cosmetic.new params[:cosmetic]

    if cosmetic.save
      return redirect_to admin_cosmetics_path, notice: "successful"
    else
      return redirect_to admin_cosmetics_path, alert: cosmetic.errors.full_messages.to_sentence
    end
  end

  def show
    @cosmetic = Cosmetic.find params[:id]
  end

  def update
    @cosmetic = Cosmetic.find params[:id]
    if @cosmetic.update_attributes params[:cosmetic]
      return redirect_to admin_cosmetics_path, notice: "successful"
    else
      return redirect_to admin_cosmetics_path, alert: @cosmetic.errors.full_messages.to_sentence
    end
  end

  def destroy
    cosmetic = Cosmetic.find params[:id]
    if cosmetic.destroy
      return redirect_to admin_cosmetics_path, notice: "successful"
    else
      return redirect_to admin_cosmetics_path, alert: cosmetic.errors.full_messages.to_sentence
    end
  end
end

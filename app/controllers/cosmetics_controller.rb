class CosmeticsController < ApplicationController
  def index
    @cosmetics = Cosmetic.shelved
  end

  def show
    @cosmetic = Cosmetic.find(params[:id])
  end
end

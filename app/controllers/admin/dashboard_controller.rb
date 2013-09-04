class Admin::DashboardController < Admin::BaseController
  def show
    @cosmetics = Cosmetic.all
    @brands = Brand.all
    @gift_certificates = GiftCertificate.all
    @orders = Order.all
  end
end

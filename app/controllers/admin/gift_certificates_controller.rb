class Admin::GiftCertificatesController < ApplicationController
  layout "admin"

  def index
    @gift_certificates = GiftCertificate.all
  end

  def new
    @gift_certificate = GiftCertificate.new
  end

  def edit
    @gift_certificate = GiftCertificate.find params[:id]
  end

  def create
    gift_certificate  = GiftCertificate.new params[:gift_certificate]

    if gift_certificate.save
      return redirect_to admin_gift_certificates_path, notice: "successful"
    else
      return redirect_to admin_gift_certificates_path, alert: gift_certificate.errors.full_messages.to_sentence
    end
  end

  def show
    @gift_certificate = GiftCertificate.find params[:id]
  end

  def update
    @gift_certificate = GiftCertificate.find params[:id]
    if @gift_certificate.update_attributes params[:gift_certificate]
      return redirect_to admin_gift_certificates_path, notice: "successful"
    else
      return redirect_to admin_gift_certificates_path, alert: @gift_certificate.errors.full_messages.to_sentence
    end
  end

  def destroy
    gift_certificate = GiftCertificate.find params[:id]
    if gift_certificate.destroy
      return redirect_to admin_gift_certificates_path, notice: "successful"
    else
      return redirect_to admin_gift_certificates_path, alert: gift_certificate.errors.full_messages.to_sentence
    end
  end
end

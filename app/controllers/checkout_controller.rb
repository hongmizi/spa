class CheckoutController < ApplicationController
  before_filter :load_order, except: [:notification]

  def checkout
    pay_request = PaypalAdaptive::Request.new

    data = {
      "returnUrl" => completed_payment_request_url, 
      "requestEnvelope" => {"errorLanguage" => "en_US"},
      "currencyCode"=>"USD",
      "receiverList"=>{"receiver"=>[{"email"=> PAYPAL_RECEIVED_EMAIL, "amount"=> @order.total }]},
      "cancelUrl"=> canceled_payment_request_url,
      "actionType"=>"PAY",
      "ipnNotificationUrl"=> checkout_notification_url
    }

    pay_response = pay_request.pay(data)

    if pay_response.success?
      redirect_to pay_response.approve_paypal_payment_url
    else
      error = pay_response.errors.first['message']
      logger.error error and redirect_to "/", alert: error
    end
  end

  def accomplish
    @cart.checkout if @cart =  Cart.shopping.find_by_id(session[:cart])

    session[:order_id] = nil
  end

  def cancel
    session[:order_id] = nil
  end

  def notification
    if env["PATH_INFO"] =~ /^\/paypal_ipn/
      request = Rack::Request.new(env)
      params = request.params

      ipn = PaypalAdaptive::IpnNotification.new
      ipn.send_back(env['rack.request.form_vars'])
      if ipn.verified?
        #mark transaction as completed in your DB
      end
    end
  end

  private
  def load_order
    @order = Order.find session[:order_id]
    if !@order.pending?
      return redirect_to root_path
    end
  end
end

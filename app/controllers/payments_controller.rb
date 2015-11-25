class PaymentsController < ApplicationController

  def new

  end

  def create
    require "stripe"
    Stripe.api_key = "sk_test_dkY8errhPdowa3cPJ9Dfei2e"

    Stripe::Charge.create(
      :amount => 9900,
      :currency => "usd",
      :source => params[:stripeToken], # obtained with Stripe.js
      :description => "MPCS52554 Example"
    )

    redirect_to root_url
  end
end

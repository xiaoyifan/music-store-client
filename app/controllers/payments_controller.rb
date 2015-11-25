class PaymentsController < ApplicationController

  def new

  end

  def create
    require "stripe"
    Stripe.api_key = "sk_test_dkY8errhPdowa3cPJ9Dfei2e"
    @product = Product.find_by_id(params[:productId])

    Stripe::Charge.create(
      :amount => @product.price,
      :currency => "usd",
      :source => params[:stripeToken], # obtained with Stripe.js
      :description => @product.title
    )

    order = Order.create user_id:current_user.uid, product_id: @product.id, amount: @product.price, created_at:DateTime.new(), updated_at: DateTime.new()
    redirect_to root_url, notice: "The #{@product.title} is on its way!"
  end
end

class ProductsController < ApplicationController

  def index
    @products = Product.limit(1000)
  end

end

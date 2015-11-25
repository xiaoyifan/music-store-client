require 'open-uri'

class ProductsController < ApplicationController

   def index
  #@products = Product.all
     json = open("http://localhost:4000/inventory.json").read
    puts "###################"
    puts json
    puts "###################"
    @products = JSON.parse(json)
   end

end

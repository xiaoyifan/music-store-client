class OrdersController < ApplicationController

  def index
    @list = Order.where(user_id: current_user.uid).limit(1000)
  end

  def new

  end

  def create
  end
end

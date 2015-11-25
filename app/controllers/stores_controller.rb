require 'net/http'
require "json"

class StoresController < ApplicationController

  def index
    @stores = Store.order(:address).limit(1000)
  end

  def show
    @store = Store.find_by_id(params[:id])

    if @store

      url = URI.parse('http://www.divvybikes.com/stations/json')
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port){ |http|
        http.request(req)
      }

      response = res.body
      data = JSON.parse(response)
      @list = data["stationBeanList"]

    else
      redirect_to root_url, notice: "Whoops!" unless @store
    end

  end

end

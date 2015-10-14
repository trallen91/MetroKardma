class StationsController < ApplicationController
  def index
    @stations = Station.all
    render :json => @stations, :include => :kardma_exchanges
  end
end
class StationsController < ApplicationController
  def index
    @stations = Station.all
    render :json => @stations, :include => :kardma_exchanges
  end

  def show
    @station = Station.find_by(id: params[:id])
    render :json => @station, :include => :kardma_exchanges
  end
end
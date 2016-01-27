class StationsController < ApplicationController
  def index
    @stations = Station.all
    render :json => @stations
  end

  def show
    @station = Station.find_by(id: params[:id])
    render :json => @station
  end
end
class StationsController < ApplicationController
  def index
    @stations = Station.all
    render :json => @stations
  end

  def show
    @station = Station.find_by(id: params[:id])
    if params[:user_role] == "swiper"
      render :json => @station.to_json(:include => {:exchanges_needing_giver => {:include => :receiver}})
    elsif params[:user_role] == "swipee"
      render :json => @station.to_json(:include => {:exchanges_needing_receiver => {:include => :giver}})
    end
  end
end
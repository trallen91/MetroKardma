class StationsController < ApplicationController
  def index
    @stations = Station.all
    if params[:user_role] == "swiper"
      render :json => @stations.to_json(:include => {:exchanges_needing_swiper => {:include => {:swipee => {:methods => :average_rating}}}})
    elsif params[:user_role] == "swipee"
      render :json => @stations.to_json(:include => {:exchanges_needing_swipee => {:include => {:swiper => {:methods => :average_rating}}}})
    end
  end

  def show
    @station = Station.find_by(id: params[:id])
    render :json => @station
  end
end
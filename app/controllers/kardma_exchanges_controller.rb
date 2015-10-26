class KardmaExchangesController < ApplicationController

  def create
    station = Station.find_by(id: params[:station_id])
    if params[:role] == "swiper"
      KardmaExchange.create(station: station, giver: current_user)
      render json: {message: "Successfully created"}, status: 200
    elsif params[:role] == "swipee"
      KardmaExchange.create(station: station, receiver: current_user)
      render json: {message: "Successfully created"}, status: 200
    else
      render json: {message: "Something went wrong"}, status: 500
    end
  end
end
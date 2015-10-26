class KardmaExchangesController < ApplicationController

  def create
    station = Station.find_by(id: params[:station_id])
    #the below line will be simplified once we replace giver and receiver with swiper and swipee in the rails app
    params[:role] == "swiper" ? role = "giver" : role = "receiver"
    ke = KardmaExchange.new(station:station)
    #the send method allows you to use a variable in place of an attribute name, and the '=' allows you to set that attribute to the value that follows the comma
    ke.send(role+'=', current_user)

    if ke.save
      render json: {message: "Successfully created"}, status: 200
    else
      render json: {message: "Something went wrong"}, status: 500
    end
  end
end
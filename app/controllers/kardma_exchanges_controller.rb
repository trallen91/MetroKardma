class KardmaExchangesController < ApplicationController

  def create
    station = Station.find_by(id: params[:station_id])
    params[:role] == "swiper" ? role = "giver" : role = "receiver"
    @ke = KardmaExchange.new(station:station)
    @ke.send(role+'=', current_user)


    if @ke.save
      render json: {message: "Successfully created"}, status: 200
    else
      render json: {:errors => @ke.errors.full_messages }
    end
  end

  def destroy
    ke = KardmaExchange.find_by(id: params[:id])

    if ke.destroy
      render json: {message: "Successfully deleted"}, status: 200
    else
      render json: {message: "Something went wrong"}, status: 500
    end
  end

end
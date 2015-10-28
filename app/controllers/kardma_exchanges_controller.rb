class KardmaExchangesController < ApplicationController

  def create
    station = Station.find_by(id: params[:station_id])
    #the below line will be simplified once we replace giver and receiver with swiper and swipee in the rails app
    params[:role] == "swiper" ? role = "giver" : role = "receiver"
    @ke = KardmaExchange.new(station:station)
    #the send method allows you to use a variable in place of an attribute name, and the '=' allows you to set that attribute to the value that follows the comma
    @ke.send(role+'=', current_user)

    # if current_user.has_pending_exchange?
    #   render json: {message: "You already have a pending exchange.  Please cancel that one before creating this request"}
    if @ke.save
      # redirect_to @ke
      render json: {message: "Successfully created"}, status: 200
    else
      render json: {message: "Something went wrong"}, status: 500
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
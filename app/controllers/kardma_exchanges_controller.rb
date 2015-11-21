class KardmaExchangesController < ApplicationController

  def create
    station = Station.find_by(id: params[:station_id])
    @ke = KardmaExchange.new(station:station)
    role = params[:role]
    @ke.send(role+'=', current_user)
    @ke.current_user = current_user

    if @ke.save
      render json: {message: "Successfully created"}, status: 200
    else
      render json: {:errors => @ke.errors.full_messages }
    end
  end


  def search_by_swiper_swipee
    @swiper_or_swipee = params[:swiperOrSwipee]
    if @swiper_or_swipee == 'swiper'
      @ke = KardmaExchange.where("swiper_id = ?", current_user.id)
    else
      @ke = KardmaExchange.where("swipee_id = ?", current_user.id)
    end
    render :json => @ke.first
  end

  def update
    #Complete this exchange
    @ke = KardmaExchange.find_by(id: params[:id])
    @ke.complete = true
    @ke.current_user = current_user
    if @ke.save
      render json: {message: "Successfully updated"}, status: 200
    else
      render json: {:errors => @ke.errors.full_messages }, status: 500
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

  def update_with_match
    @ke = KardmaExchange.find_by(id: params[:id])
    role = params[:role]
    @ke.send(role+'=', current_user)
    @ke.current_user = current_user

    if @ke.save
      render json: {message: "Successfully created"}, status: 200
    else
      render json: {:errors => @ke.errors.full_messages }
    end
  end

end
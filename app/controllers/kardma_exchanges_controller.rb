class KardmaExchangesController < ApplicationController

  def index
    kes = KardmaExchange.all
    render :json => kes.to_json
  end

  def create
    station = Station.find_by(id: params[:station_id])
    @ke = KardmaExchange.new(station:station)
    role = params[:role]
    @ke.send(role+'=', current_user)

    if @ke.save
      render json: {exchange_id: @ke.id}
    else
      # render json: {:errors => @ke.errors.full_messages }
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

  def update_with_complete
     @ke = KardmaExchange.find_by(id: params[:id])
     @ke.complete = true
     if @ke.save
       render :json => @ke.to_json
     else
       render json: {:errors => @ke.errors.full_messages }
     end
   end

  def show
    @ke = KardmaExchange.find_by(id: params[:id])

    render :json => @ke.to_json(:methods => :chat)
  end

  def update_with_match
    @ke = KardmaExchange.find_by(id: params[:id])
     # role = params[:role]
     # @ke.send(role+'=', current_user)

     if @ke.swiper == nil
        @ke.swiper = current_user
     elsif @ke.swipee == nil
        @ke.swipee = current_user
     end

     if @ke.save
       render json: {exchange_id: @ke.id}
     else
      #This error handling process sucks
       render json: {:errors => @ke.errors.full_messages }
     end
   end

   def show_pending_exchange_for_user
      user = User.find_by(id: params[:user_id])
      ke = user.pending_exchange
      render :json => ke.to_json(:methods => :chat)
   end

end
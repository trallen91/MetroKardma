class ChatsController < ApplicationController
  respond_to :json

  def show
    @chat = Chat.find(params[:id])
    # @receiver = interlocutor(@chat)
    render :json => @chat.to_json(:include => {:kardma_exchange => {}})
  end

  def create
    #@chat = Chat.new(chat_params)
    # @isBetween = Chat.between(params[:swiper_id], params[:swipee_id])
    # if @isBetween.present?
    #   @chat = @isBetween.first
    # else
    # end
    ke = KardmaExchange.find_by(id: params[:exchange_id])
    @chat = Chat.new({kardma_exchange: ke})
    if @chat.save
      render json: {chat_id: @chat.id}
    else
      render json: {message: "Something went wrong"}, status: 500
    end
  end

  def get_chat_for_user
    # @chat = Chat.joins(:kardma_exchange).where("complete = ? AND (swiper_id = ? OR swipee_id = ?", false, params[:user_id], params[:user_id]).first

    render :json => @chat.to_json(:include => {:kardma_exchange => {}})
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_chat
    @chat = Chat.find(params[:id])
  end

  def interlocutor(chat)
    current_user == chat.swipee_id ? chat.swipee_id : chat.swiper_id
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def chat_params
    params.permit(:exchange_id)
  end
end
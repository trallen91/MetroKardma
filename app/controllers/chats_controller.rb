class ChatsController < ApplicationController
  respond_to :json

  def show
    @chat = Chat.find(params[:id])
    @receiver = interlocutor(@chat)
    render :json => @chat
  end

  def create
    #@chat = Chat.new(chat_params)
    # binding.pry
    # @isBetween = Chat.between(params[:swiper_id], params[:swipee_id])
    # if @isBetween.present?
    #   @chat = @isBetween.first
    # else
    @chat = Chat.create!(chat_params)
    # end
    render json: {chat_id: @chat.id}
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
    params.permit(:swiper_id, :swipee_id, :swiperSwipeeObj)
  end
end
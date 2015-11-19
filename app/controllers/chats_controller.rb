class ChatsController < ApplicationController
  respond_to :json

  def show
    @chat = Chat.find(params[:id])
    @receiver = interlocutor(@chat)
    render :json => @chat
  end

  def create
    #find the chat or create it if it doesn't exist
    @is_between = Chat.where(swiper_id: params[:swiper_id], swipee_id: params[:swipee_id])

    if @is_between.length > 1
      @error_text = "More than one Chat exits between two users as the same role"
      render json: {message: @error_text}, status: 500
      raise @error_text
    end

    if @is_between.present?
      @chat = @is_between.first
    else
      @chat = Chat.create!(chat_params)
    end
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
    params.permit(:swiper_id, :swipee_id)
  end
end
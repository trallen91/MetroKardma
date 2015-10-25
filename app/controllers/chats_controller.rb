class ChatsController < ApplicationController
  #before_filter :authenicate_us

  layout false

  # GET /chats/1
  # GET /chats/1.json
  def show
    @chat = Chat.find(params[:id])
    @receiver = interlocutor(@chat)
    @messages = @chat.messages
    @message = Message.new
    render json: $message
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  # POST /chats.json
  def create
    #@chat = Chat.new(chat_params)
    @isBetween = Chat.between(params[:swiper_id], params[:swipee_id])
    if @isBetween.present?
      @chat = @isBetween.first
    else
      @chat = Chat.create!(chat_params)
    end
    render json: {chat_id: @chat.id}
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url, notice: 'Chat was successfully destroyed.' }
      format.json { head :no_content }
    end
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

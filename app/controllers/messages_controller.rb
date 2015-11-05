class MessagesController < ApplicationController
  #before_filter :authenticate_user!

  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!
    @message.body = 'youre dumb'
    @path = chats_path(@chat)
    PrivatePub.publish_to "/messages/new", :chat_message => "test"
    PrivatePub.subscription
    render :json => @chat
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
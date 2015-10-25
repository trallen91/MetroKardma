class Message < ActiveRecord::Base
  #this is derived from here http://josephndungu.com/tutorials/gmail-like-chat-application-in-ruby-on-rails
  belongs_to :chat
  belongs_to :user

  validates_presence_of :body, :chat_id, :user_id
end

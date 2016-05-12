class Chat < ActiveRecord::Base
  belongs_to :kardma_exchange


  #
  # validates_uniqueness_of :swipee_id, :scope => :swipee
  has_many :messages, dependent: :destroy

  #Below is Schwenk code for finding a chat based on the swiper/swipee.  Would be deleted when chat is associated with and exchange

  # scope :involving, -> (user) do
  #     where("chats.swiper_id = ? OR chats.swipee_id = ?", user.id, user.id)
  # end

  # scope :between, -> (swiper_id, swipee_id) do
  #   where("(chats.swiper_id = ? AND chats.swipee_id = ?) OR (chats.swipee_id = ? AND chats.swiper_id = ?) ", swiper_id,swipee_id, swiper_id,swipee_id)
  # end

end

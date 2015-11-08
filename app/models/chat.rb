class Chat < ActiveRecord::Base
  belongs_to :swiper, :class_name => 'User', :foreign_key => 'swiper_id'
  belongs_to :swipee, :class_name => 'User', :foreign_key => 'swipee_id'

  #
  # validates_uniqueness_of :swipee_id, :scope => :swipee
  has_many :messages, dependent: :destroy


  scope :involving, -> (user) do
      where("chats.swiper_id = ? OR chats.swipee_id = ?", user.id, user.id)
  end

  scope :between, -> (swiper_id, swipee_id) do
    where("(chats.swiper_id = ? AND chats.swipee_id = ?) OR (chats.swipee_id = ? AND chats.swiper_id = ?) ", swiper_id,swipee_id, swiper_id,swipee_id)
  end

end

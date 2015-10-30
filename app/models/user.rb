class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :given_ratings, class_name: :Rating, foreign_key: :rater_id
  has_many :received_ratings, class_name: :Rating, foreign_key: :rated_user_id


  has_many :chats

  has_many :given_swipes, class_name: :KardmaExchange, foreign_key: :swiper_id
  has_many :received_swipes, class_name: :KardmaExchange, foreign_key: :swipee_id

  def has_pending_exchange?
    (self.given_swipes.where(complete: false).length + self.received_swipes.where(complete: false).length) > 0
  end

end

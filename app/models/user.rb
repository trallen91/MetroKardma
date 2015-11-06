class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :given_ratings, class_name: :Rating, foreign_key: :rater_id
  has_many :received_ratings, class_name: :Rating, foreign_key: :rated_user_id


  has_many :chats

  has_many :given_swipes, class_name: :KardmaExchange, foreign_key: :swiper_id
  has_many :received_swipes, class_name: :KardmaExchange, foreign_key: :swipee_id

  def has_pending_exchange?
    !!self.pending_exchange
  end

  def pending_exchange
    if self.given_swipes.where(complete:false).length > 0
      return self.given_swipes.where(complete:false).first
    elsif self.received_swipes.where(complete:false).length > 0
      return self.received_swipes.where(complete:false).first
    end
  end

  def role_in_pending_exchange
    if self.pending_exchange.swiper == self
      return "Swiper"
    elsif self.pending_exchange.swipee == self
      return "Swipee"
    end
  end


  def kardma_count
    self.given_swipes.where(complete: true).length - self.received_swipes.where(complete: true).length + 5
  end

  def average_rating
    self.received_ratings.inject(0) {|sum, n| sum + n}
  end
end

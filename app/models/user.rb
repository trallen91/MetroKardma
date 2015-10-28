class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :given_ratings, class_name: :Rating, foreign_key: :rater_id
  has_many :received_ratings, class_name: :Rating, foreign_key: :rated_user_id


  has_many :chats

  has_many :given_kardmas, class_name: :KardmaExchange, foreign_key: :giver_id
  has_many :received_kardmas, class_name: :KardmaExchange, foreign_key: :receiver_id

  def has_pending_exchange?
    (self.given_kardmas.where(complete: false).length + self.received_kardmas.where(complete: false).length) > 0
  end

end

class User < ActiveRecord::Base
  has_secure_password

  has_many :given_ratings, class_name: :Rating, foreign_key: :rater_id
  has_many :received_ratings, class_name: :Rating, foreign_key: :rated_user_id

  has_many :given_kardmas, class_name: :KardmaExchange, foreign_key: :giver_id
  has_many :received_kardmas, class_name: :KardmaExchange, foreign_key: :receiver_id

  validates_presence_of :email, :username, :picture
  validates_uniqueness_of :email, :username, :on => :create
  validates_length_of :email, :username, maximum: 50, :on => :save
  validates_email_format_of :email, message: "is not in a valid format"
  validates :password, :presence => true, :length => {minimum: 6}, :on => :create
end

class User < ActiveRecord::Base
  has_secure_password

  has_many :given_ratings, class_name: :Rating, foreign_key: :rater_id
  has_many :received_ratings, class_name: :Rating, foreign_key: :rated_user_id

  has_many :given_kardmas, class_name: :Kardma, foreign_key: :giver_id
  has_many :received_kardmas, class_name: :Kardma, foreign_key: :receiver_id
end

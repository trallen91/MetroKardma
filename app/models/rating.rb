class Rating < ActiveRecord::Base
  belongs_to :rater, class_name: :User
  belongs_to :rated_user, class_name: :User
end

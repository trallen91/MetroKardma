class Chat < ActiveRecord::Base
  belongs_to :swiper, :class_name => 'User', :foreign_key => 'swiper_id'
  belongs_to :swipee, :class_name => 'User', :foreign_key => 'swipee_id'
end

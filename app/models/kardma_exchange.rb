class KardmaExchange < ActiveRecord::Base
  belongs_to :station
  belongs_to :swiper, class_name: :User
  belongs_to :swipee, class_name: :User


  validate :cannot_be_multiple_pending_for_user

  attr_accessor :current_user

  def cannot_be_multiple_pending_for_user(user=nil)
    user ||= current_user
    if user.has_pending_exchange?
      errors.add(:base, "#{user.role_in_pending_exchange}")
      errors.add(:base, "#{user.pending_exchange.station.name}")
      errors.add(:base, "#{user.pending_exchange.id}")
    end
  end
end

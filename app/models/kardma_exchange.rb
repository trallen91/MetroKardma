class KardmaExchange < ActiveRecord::Base
  belongs_to :station
  belongs_to :swiper, class_name: :User
  belongs_to :swipee, class_name: :User

  validate :cannot_be_multiple_pending_for_user

  def cannot_be_multiple_pending_for_user
    swiper ? user = swiper : user = swipee
    if user.has_pending_exchange?
      errors.add(:user, "has a request as a #{user.role_in_pending_exchange} at #{user.pending_exchange.station.name}.  This exchange must first be cancelled")
    end
  end
end

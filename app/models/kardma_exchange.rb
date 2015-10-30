class KardmaExchange < ActiveRecord::Base
  belongs_to :station
  belongs_to :swiper, class_name: :User
  belongs_to :swipee, class_name: :User

  validate :cannot_be_multiple_pending_for_user

  def cannot_be_multiple_pending_for_user
    if swiper && swiper.has_pending_exchange?
      errors.add(:swiper, "has offered to provide another swipe.  Other exchange must be cancelled")
    elsif swipee && swipee.has_pending_exchange?
      errors.add(:swipee, "has requested a swipe elsehwere.  Other excahnge must be cancelled.")
    end
  end
end

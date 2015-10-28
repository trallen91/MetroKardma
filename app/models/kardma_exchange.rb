class KardmaExchange < ActiveRecord::Base
  belongs_to :station
  belongs_to :giver, class_name: :User
  belongs_to :receiver, class_name: :User

  validate :cannot_be_multiple_pending_for_user

  def cannot_be_multiple_pending_for_user
    if giver && giver.has_pending_exchange?
      errors.add(:giver, "has offered to provide another swipe.  Other exchange must be cancelled")
    elsif receiver && receiver.has_pending_exchange?
      errors.add(:receiver, "has requested a swipe elsehwere.  Other excahnge must be cancelled.")
    end
  end
end

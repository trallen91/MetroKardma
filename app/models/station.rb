class Station < ActiveRecord::Base
  has_many :kardma_exchanges

  attr_accessor :current_user

  def exchanges_needing_swiper
    self.kardma_exchanges.where('complete = ? AND swiper_id IS ?', false, nil)
  end

  def exchanges_needing_swipee
    self.kardma_exchanges.where('complete = ? AND swipee_id IS ?', false, nil)
  end

  def pending_exchange_for_user(user=nil)
    user ||= current_user

    self.kardma_exchanges.where('(swiper_id = ? OR swipee_id = ?) AND complete = ?', user.id, user.id, false)
  end

end

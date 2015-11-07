class Station < ActiveRecord::Base
  has_many :kardma_exchanges

  attr_accessor :current_user, :current_user_role

  def exchanges_needing_swiper
    self.kardma_exchanges.where('complete = ? AND swiper_id IS ?', false, nil)
  end

  def exchanges_needing_swipee
    self.kardma_exchanges.where('complete = ? AND swipee_id IS ?', false, nil)
  end

  def pending_exchange_for_user(user=nil, role=nil)
    user ||= current_user
    role ||= current_user_role

    if role == "swiper"
      self.kardma_exchanges.where('swiper_id = ? AND complete = ?', user.id, false)
    elsif role == "swipee"
      self.kardma_exchanges.where('swipee_id = ? AND complete = ?', user.id, false)
    end
  end

end

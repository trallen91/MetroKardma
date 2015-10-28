class Station < ActiveRecord::Base
  has_many :kardma_exchanges

  attr_accessor :current_user

  def exchanges_needing_giver
    self.kardma_exchanges.where('complete = ? AND giver_id IS ?', false, nil)
  end

  def exchanges_needing_receiver
    self.kardma_exchanges.where('complete = ? AND receiver_id IS ?', false, nil)
  end

  def pending_exchange_for_user(user=nil)
    user ||= current_user

    self.kardma_exchanges.where('(giver_id = ? OR receiver_id = ?) AND complete = ?', user.id, user.id, false)
  end

end

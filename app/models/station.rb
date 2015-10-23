class Station < ActiveRecord::Base
  has_many :kardma_exchanges

  def exchanges_needing_giver
    self.kardma_exchanges.where('complete = ? AND giver_id IS ?', false, nil)
  end

  def exchanges_needing_receiver
    self.kardma_exchanges.where('complete = ? AND receiver_id IS ?', false, nil)
  end

end

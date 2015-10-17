class Station < ActiveRecord::Base
  has_many :kardma_exchanges

  validates_presence_of :address

end

class Station < ActiveRecord::Base
  has_many :kardma_exchanges

  validates_presence_of :address

  # def as_json(option = {})
  #   super(options.merge(include: :kardma_exchanges))
  # end
end

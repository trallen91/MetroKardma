class KardmaExchange < ActiveRecord::Base
  belongs_to :station
  belongs_to :giver, class_name: :User
  belongs_to :receiver, class_name: :User
end

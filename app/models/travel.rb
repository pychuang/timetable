class Travel < ActiveRecord::Base
  attr_accessible :arrive_at, :arrive_to_id, :depart_at, :depart_from_id, :train_id
end

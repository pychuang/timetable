class Travel < ActiveRecord::Base
  attr_accessible :arrive_at, :arrive_to_id, :depart_at, :depart_from_id, :train_id
  belongs_to :train
  belongs_to :depart_from, :class_name => 'Station', :foreign_key => 'depart_from_id'
  belongs_to :arrive_to, :class_name => 'Station', :foreign_key => 'arrive_to_id'
end

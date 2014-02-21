class Train < ActiveRecord::Base
  attr_accessible :clockwise, :company_id, :date, :destination_id, :name, :number, :origin_id, :rank
  belongs_to :company
  belongs_to :origin, :class_name => 'Station', :foreign_key => 'origin_id'
  belongs_to :destination, :class_name => 'Station', :foreign_key => 'destination_id'
end

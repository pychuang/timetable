class Train < ActiveRecord::Base
  attr_accessible :clockwise, :company_id, :date, :destination_id, :name, :number, :origin_id, :rank
end

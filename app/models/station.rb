class Station < ActiveRecord::Base
  attr_accessible :company_id, :name
  belongs_to :company
  has_many :originates, :class_name => 'Train', :foreign_key => 'origin_id'
  has_many :destines, :class_name => 'Train', :foreign_key => 'destination_id'
end

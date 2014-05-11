class Station < ActiveRecord::Base
  attr_accessible :company_id, :name
  belongs_to :company
  has_many :originates, :class_name => 'Train', :foreign_key => 'origin_id'
  has_many :destines, :class_name => 'Train', :foreign_key => 'destination_id'
  has_many :arrivals, :class_name => 'Travel', :foreign_key => 'arrive_to_id'
  has_many :departures, :class_name => 'Travel', :foreign_key => 'depart_from_id'

  def self.search(name)
    Station.where('name LIKE :m', :m => "%#{name}%")
  end
end

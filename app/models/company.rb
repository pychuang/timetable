class Company < ActiveRecord::Base
  attr_accessible :abbrev, :name
  has_many :stations, :dependent => :destroy
  has_many :trains, :dependent => :destroy
end

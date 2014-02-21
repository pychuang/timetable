class Station < ActiveRecord::Base
  attr_accessible :company_id, :name
  belongs_to :company
end

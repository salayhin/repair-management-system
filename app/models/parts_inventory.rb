class PartsInventory < ActiveRecord::Base

  #validation
  validates_uniqueness_of :name

end

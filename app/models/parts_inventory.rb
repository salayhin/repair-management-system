class PartsInventory < ActiveRecord::Base

  has_and_belongs_to_many :repair_informations
  #validation
  validates_uniqueness_of :name

end

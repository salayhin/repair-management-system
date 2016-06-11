class PartsInventory < ActiveRecord::Base

  has_and_belongs_to_many :repair_informations
  belongs_to :service_center
  #validation
  validates_uniqueness_of :name

end

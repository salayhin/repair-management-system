# service center are the editional part for the system
# user will be assigned to different ServiceCenters to structured the system
class ServiceCenter < ActiveRecord::Base
  # associations
  has_many :profiles
  has_many :repair_orders, :dependent => :destroy

  # validations
  validates_presence_of :name, :address, :phone

  # scopes


  # instance methods

end

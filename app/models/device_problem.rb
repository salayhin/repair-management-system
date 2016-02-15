# service center are the editional part for the system
# user will be assigned to different ServiceCenters to structured the system
class DeviceProblem < ActiveRecord::Base
  # associations

  # validations
  validates_presence_of :name, :description, :status

  # scopes


  # instance methods

end

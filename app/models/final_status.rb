class FinalStatus < ActiveRecord::Base
  # associations
  has_many :repair_informations

  # validations
  validates_presence_of :name, :status

  # scopes


  # instance methods
end

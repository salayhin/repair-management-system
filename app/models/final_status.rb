class FinalStatus < ActiveRecord::Base
  # associations

  # validations
  validates_presence_of :name, :status

  # scopes


  # instance methods
end

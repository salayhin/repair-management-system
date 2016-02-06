# every user has a profile
# It'll contain basic information about the user
class Profile < ActiveRecord::Base

  # associations
  belongs_to :user

  # validations
  validates_presence_of :first_name, :last_name, :mobile, :address
  mount_uploader :photo, ProfilePhotoUploader

  # instance methods
  def full_name
    self.first_name + ' ' + self.last_name
  end

end

# DeviceBrand are like "Nokia", "Samsung"
# DeviceBrand must have some DeviceModels like "Lumia-1232"
class DeviceBrand < ActiveRecord::Base

  # associations


  # validations
  validates_presence_of :name
  validates_uniqueness_of :name

  mount_uploader :logo, DevicePictureUploader

end

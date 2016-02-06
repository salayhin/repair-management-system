# deviceModel is dependent on DeviceBrand
# If Brand is 'Nokia' then Model 'Lumia-1213'
class DeviceModel < ActiveRecord::Base

  # associations
  belongs_to :device_brand

  # validations
  validates_presence_of :name, :device_brand_id
  validates_uniqueness_of :name

  mount_uploader :logo, DevicePictureUploader

end

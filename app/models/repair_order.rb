class RepairOrder < ActiveRecord::Base

  # class methods
  serialize :device_condition
  serialize :accessories_present

  # associations
  belongs_to :device_brand
  belongs_to :device_model
  belongs_to :service_center
  belongs_to :creator, :class_name => 'User'
  has_many :repair_assignments, :dependent => :destroy
  accepts_nested_attributes_for :repair_assignments

  # uploads
  mount_uploader :invoice, OrderInvoiceUploader

  # validations
  validates_presence_of :device_brand_id, :device_model_id, :service_center_id,
                        :customer_name, :customer_email, :customer_contact_no,
                        :imei1
  validates :imei2, length: {is: 15}, allow_blank: true
  validates :imei1, length: {is: 15}, allow_blank: false

  # class variables
  ACCESORIES = {
    1 => 'Battery',
    2 => 'Back Cover',
    3 => 'Adaptor',
    4 => 'USB Cable',
    5 => 'Full Charger',
    6 => 'Handsfree',
    7 => 'Stylus / Stick',
    8 => 'MMC Card',
    9 => 'SIM Card'
  }
  DEVICE_CONDITIONS = {
    1 => 'Physical Damaged',
    2 => 'Liquid Damaged',
    3 => 'Battery Bulged',
    4 => 'Accessories Damaged',
    5 => 'Third Party Handled',
    6 => 'Unit OUT Warranty'
  }

  # callbacks

  # scopes

  # instance methods


end

class RepairInformation < ActiveRecord::Base
  belongs_to :activity_status
  belongs_to :final_status
  belongs_to :repair_order
  belongs_to :repair_assignment
  has_and_belongs_to_many :parts_inventories
end

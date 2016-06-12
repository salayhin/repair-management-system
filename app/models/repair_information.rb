class RepairInformation < ActiveRecord::Base
  belongs_to :activity_status
  belongs_to :final_status
  belongs_to :repair_order
  belongs_to :repair_assignment
  has_and_belongs_to_many :parts_inventories

  accepts_nested_attributes_for :repair_assignment, :reject_if => lambda { |a| a[:assigned_id].blank? }
  attr_accessor :parts
  attr_reader :parts

  def parts=(ids)
    prevParts = self.parts_inventories.pluck(:id)
    currentParts = ids.split(",")
    self.parts_inventory_ids = currentParts
    currentParts.each do |id|
      part = PartsInventory.find(id.to_i)
      part.update(used: part.used + 1, stock: part.stock - 1 )
    end
    prevParts.each do |id|
      part = PartsInventory.find(id.to_i)
      part.update(used: part.used - 1, stock: part.stock + 1 )
    end
  end
end

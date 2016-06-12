class AddColumnDeliveredToRepairOrder < ActiveRecord::Migration
  def change
    add_column :repair_orders, :delivered, :boolean, default: false
  end
end

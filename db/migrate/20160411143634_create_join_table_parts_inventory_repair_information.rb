class CreateJoinTablePartsInventoryRepairInformation < ActiveRecord::Migration
  def change
    create_join_table :parts_inventories, :repair_informations do |t|
      # t.index [:parts_inventory_id, :repair_information_id]
      # t.index [:repair_information_id, :parts_inventory_id]
    end
  end
end

class AddColumnServiceCenterIdToPartsInventory < ActiveRecord::Migration
  def change
    add_column :parts_inventories, :service_center_id, :integer
  end
end

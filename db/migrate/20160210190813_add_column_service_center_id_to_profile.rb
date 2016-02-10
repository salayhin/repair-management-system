class AddColumnServiceCenterIdToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :service_center_id, :integer
  end
end

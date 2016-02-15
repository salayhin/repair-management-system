class CreateDeviceStatuses < ActiveRecord::Migration
  def change
    create_table :device_statuses do |t|
      t.string :name
      t.string :status
      t.integer :activity_status_id

      t.timestamps null: false
    end
  end
end

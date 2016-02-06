class CreateDeviceModels < ActiveRecord::Migration
  def change
    create_table :device_models do |t|
      t.string  :name
      t.string  :logo
      t.integer :device_brand_id

      t.timestamps null: false
    end
  end
end

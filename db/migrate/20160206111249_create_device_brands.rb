class CreateDeviceBrands < ActiveRecord::Migration
  def change
    create_table :device_brands do |t|
      t.string  :name
      t.string  :logo

      t.timestamps null: false
    end
  end
end

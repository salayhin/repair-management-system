class CreatePartsInventories < ActiveRecord::Migration
  def change
    create_table :parts_inventories do |t|
      t.string    :name
      t.integer   :stock
      t.integer   :used, :default => 0
      t.string    :identification_no
      t.text      :description
      t.boolean   :status, :default => true

      t.timestamps null: false
    end
  end
end

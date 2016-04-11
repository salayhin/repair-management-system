class CreateRepairInformations < ActiveRecord::Migration
  def change
    create_table :repair_informations do |t|
      t.integer   :repair_order_id
      t.integer   :repair_assignment_id
      t.integer   :activity_status_id
      t.integer   :final_status_id
      t.boolean   :deliverable, :default => false

      t.timestamps null: false
    end
  end
end

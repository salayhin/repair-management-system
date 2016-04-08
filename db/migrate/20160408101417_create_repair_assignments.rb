class CreateRepairAssignments < ActiveRecord::Migration
  def change
    create_table :repair_assignments do |t|
      t.integer     :assigner_id
      t.integer     :assigned_id
      t.integer     :repair_order_id
      t.boolean     :transferred_job
      t.text        :comment

      t.timestamps null: false
    end
  end
end

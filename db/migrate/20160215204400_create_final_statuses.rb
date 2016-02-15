class CreateFinalStatuses < ActiveRecord::Migration
  def change
    create_table :final_statuses do |t|
      t.string :name
      t.string :status

      t.timestamps null: false
    end
  end
end

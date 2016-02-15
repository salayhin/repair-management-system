class CreateDeviceProblems < ActiveRecord::Migration
  def change
      create_table :device_problems do |t|
        t.string    :name
        t.string    :description
        t.string    :status

        t.timestamps null: false
      end
  end
end

class CreateServiceCenters < ActiveRecord::Migration
  def change
    create_table :service_centers do |t|
      t.string    :name
      t.string    :address
      t.string    :city
      t.string    :phone
      t.boolean   :is_active, default: true

      t.timestamps null: false
    end
  end
end

class CreateRepairOrders < ActiveRecord::Migration
  def change
    create_table :repair_orders do |t|
      t.integer   :creator_id      # created_by -> UserId
      t.integer   :device_brand_id
      t.integer   :device_model_id
      t.integer   :service_center_id
      t.string    :imei1        # mandatory field (15 digits must)
      t.string    :imei2
      t.date      :purchase_date
      t.boolean   :warranty, :default => false
      t.string    :customer_name
      t.string    :customer_email
      t.string    :customer_contact_no
      t.text      :customer_address
      t.string    :dealer
      t.boolean   :full_boxed
      t.text      :remarks
      t.text      :device_condition #hash
      t.text      :accessories_present #hash
      t.string    :invoice
      t.date      :delivery_date


      t.timestamps null: false
    end
  end
end

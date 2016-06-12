# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160612192423) do

  create_table "activity_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "status",                 default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "device_brands", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "logo",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "device_models", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "logo",            limit: 255
    t.integer  "device_brand_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "device_problems", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "status",                  default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "device_statuses", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.boolean  "status",                         default: false
    t.integer  "activity_status_id", limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "final_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "status",                 default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "parts_inventories", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "stock",             limit: 4
    t.integer  "used",              limit: 4,     default: 0
    t.string   "identification_no", limit: 255
    t.text     "description",       limit: 65535
    t.boolean  "status",                          default: true
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "service_center_id", limit: 4
  end

  create_table "parts_inventories_repair_informations", id: false, force: :cascade do |t|
    t.integer "parts_inventory_id",    limit: 4, null: false
    t.integer "repair_information_id", limit: 4, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.string   "first_name",        limit: 255
    t.string   "last_name",         limit: 255
    t.string   "mobile",            limit: 255
    t.text     "address",           limit: 65535
    t.string   "photo",             limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "service_center_id", limit: 4
  end

  create_table "repair_assignments", force: :cascade do |t|
    t.integer  "assigner_id",     limit: 4
    t.integer  "assigned_id",     limit: 4
    t.integer  "repair_order_id", limit: 4
    t.boolean  "transferred_job"
    t.text     "comment",         limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "repair_informations", force: :cascade do |t|
    t.integer  "repair_order_id",      limit: 4
    t.integer  "repair_assignment_id", limit: 4
    t.integer  "activity_status_id",   limit: 4
    t.integer  "final_status_id",      limit: 4
    t.boolean  "deliverable",                    default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "repair_orders", force: :cascade do |t|
    t.integer  "creator_id",          limit: 4
    t.integer  "device_brand_id",     limit: 4
    t.integer  "device_model_id",     limit: 4
    t.integer  "service_center_id",   limit: 4
    t.string   "imei1",               limit: 255
    t.string   "imei2",               limit: 255
    t.date     "purchase_date"
    t.boolean  "warranty",                          default: false
    t.string   "customer_name",       limit: 255
    t.string   "customer_email",      limit: 255
    t.string   "customer_contact_no", limit: 255
    t.text     "customer_address",    limit: 65535
    t.string   "dealer",              limit: 255
    t.boolean  "full_boxed"
    t.text     "remarks",             limit: 65535
    t.text     "device_condition",    limit: 65535
    t.text     "accessories_present", limit: 65535
    t.string   "invoice",             limit: 255
    t.date     "delivery_date"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.boolean  "delivered",                         default: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", limit: 4
    t.integer "user_id", limit: 4
  end

  create_table "service_centers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "city",       limit: 255
    t.string   "phone",      limit: 255
    t.boolean  "is_active",              default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "mobile_no",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["mobile_no"], name: "index_users_on_mobile_no", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

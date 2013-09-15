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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130915073142) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "carts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "state"
  end

  add_index "carts", ["user_id"], :name => "index_carts_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "cosmetics", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "brand_id"
    t.string   "type"
    t.string   "state"
    t.integer  "stock"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "cosmetics", ["brand_id"], :name => "index_cosmetics_on_brand_id"
  add_index "cosmetics", ["category_id"], :name => "index_cosmetics_on_category_id"

  create_table "gift_certificates", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "brand_id"
    t.string   "state"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cart_id"
    t.integer  "quantity"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "listing_id"
    t.decimal  "price",      :precision => 8, :scale => 2
    t.integer  "order_id"
  end

  add_index "line_items", ["cart_id"], :name => "index_line_items_on_cart_id"
  add_index "line_items", ["listing_id"], :name => "index_line_items_on_listing_id"
  add_index "line_items", ["user_id"], :name => "index_line_items_on_user_id"

  create_table "listings", :force => true do |t|
    t.integer  "stock"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "purchasable_id"
    t.string   "purchasable_type"
    t.decimal  "price",            :precision => 8, :scale => 2
  end

  add_index "listings", ["purchasable_id"], :name => "index_listings_on_purchasable_id"
  add_index "listings", ["purchasable_type"], :name => "index_listings_on_purchasable_type"

  create_table "listings_option_values", :force => true do |t|
    t.integer "listing_id"
    t.integer "option_value_id"
  end

  add_index "listings_option_values", ["listing_id"], :name => "index_listings_option_values_on_listing_id"
  add_index "listings_option_values", ["option_value_id"], :name => "index_listings_option_values_on_option_value_id"

  create_table "option_types", :force => true do |t|
    t.integer  "purchasable_id"
    t.string   "purchasable_type"
    t.string   "name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "option_types", ["purchasable_id"], :name => "index_option_types_on_purchasable_id"
  add_index "option_types", ["purchasable_type"], :name => "index_option_types_on_purchasable_type"

  create_table "option_values", :force => true do |t|
    t.integer  "option_type_id"
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "option_values", ["option_type_id"], :name => "index_option_values_on_option_type_id"

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.string   "state"
    t.text     "address"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

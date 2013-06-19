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

ActiveRecord::Schema.define(:version => 20130619170442) do

  create_table "categories", :force => true do |t|
    t.string   "category_name"
    t.string   "category_image"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "owner_id"
    t.string   "website"
    t.string   "logo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "coupons", :force => true do |t|
    t.string   "preview_image"
    t.string   "showcase_image"
    t.string   "title"
    t.string   "description"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "phone"
    t.integer  "company_id"
    t.string   "website"
    t.string   "redeem_schedule"
    t.date     "begin_date"
    t.date     "end_date"
    t.string   "redeem_code"
    t.integer  "number_of_coupons"
    t.integer  "category_id"
    t.integer  "price_without_coupon"
    t.integer  "price_with_coupon"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "favorites", :force => true do |t|
    t.string   "user_id"
    t.integer  "coupon_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "filters", :force => true do |t|
    t.string   "user_id"
    t.string   "filters"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transactions", :force => true do |t|
    t.string   "user_id"
    t.integer  "coupon_id"
    t.date     "buy_date"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "favorite"
    t.string   "savings"
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end

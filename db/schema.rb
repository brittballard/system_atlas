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

ActiveRecord::Schema.define(:version => 20110422051927) do

  create_table "application_servers", :force => true do |t|
    t.integer  "web_server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",            :limit => 50
    t.string   "description",     :limit => 250
    t.integer  "organization_id"
  end

  create_table "applications", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  create_table "business_units", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",            :limit => 50
    t.string   "description",     :limit => 250
    t.integer  "organization_id"
  end

  create_table "database_servers", :force => true do |t|
    t.integer  "database_software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                 :limit => 50
    t.string   "description",          :limit => 250
    t.integer  "organization_id"
  end

  create_table "entities", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "entity_definition_type", :limit => 50
    t.integer  "entity_definition_id"
    t.string   "system_identifier",      :limit => 45
    t.integer  "organization_id"
  end

  create_table "entity_relationships", :force => true do |t|
    t.integer "parent_id"
    t.integer "child_id"
    t.boolean "is_owner"
    t.string  "description"
  end

  create_table "hardwares", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",              :limit => 100
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city",              :limit => 100
    t.string   "state",             :limit => 50
    t.string   "postal_code",       :limit => 10
    t.integer  "registration_code"
  end

  add_index "organizations", ["registration_code"], :name => "organizations_registration_code", :unique => true

  create_table "people", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "first_name",      :limit => 50
    t.string   "last_name",       :limit => 50
    t.integer  "organization_id"
    t.integer  "user_id"
  end

  create_table "servers", :force => true do |t|
    t.integer  "operating_system_software_id"
    t.string   "ip_address",                   :limit => 100
    t.float    "ram"
    t.float    "hard_disk_space"
    t.float    "cpu_speed"
    t.integer  "cpu_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  create_table "softwares", :force => true do |t|
    t.string   "version",    :limit => 10
    t.string   "licenses",   :limit => 10
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       :limit => 100
  end

  create_table "systems", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",            :limit => 50
    t.string   "description",     :limit => 250
    t.integer  "organization_id"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                                 :null => false
    t.string   "crypted_password"
    t.string   "password_salt",                                         :null => false
    t.integer  "organization_id"
    t.integer  "roles_mask"
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

end

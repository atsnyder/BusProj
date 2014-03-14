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

ActiveRecord::Schema.define(:version => 20140219182333) do

  create_table "2014march7", :primary_key => "TRIP_ID", :force => true do |t|
    t.string   "COMPANY_NAME", :limit => 40
    t.string   "DEPART_CITY",  :limit => 40
    t.string   "ARRIVE_CITY",  :limit => 40
    t.datetime "DEPART_TIME"
    t.datetime "ARRIVE_TIME"
    t.string   "TRIP_LENGTH",  :limit => 12
    t.integer  "TRIP_COST"
    t.string   "URL",          :limit => 500
  end

  create_table "2014march8", :primary_key => "TRIP_ID", :force => true do |t|
    t.string   "COMPANY_NAME", :limit => 40
    t.string   "DEPART_CITY",  :limit => 40
    t.string   "ARRIVE_CITY",  :limit => 40
    t.datetime "DEPART_TIME"
    t.datetime "ARRIVE_TIME"
    t.string   "TRIP_LENGTH",  :limit => 12
    t.integer  "TRIP_COST"
    t.string   "URL",          :limit => 500
  end

  create_table "boltbus_makeup", :primary_key => "TRIP_ID", :force => true do |t|
    t.string "COMPANY_NAME", :limit => 40
    t.string "DEPART_CITY",  :limit => 40
    t.string "ARRIVE_CITY",  :limit => 40
    t.date   "DEPART_DATE"
  end

  create_table "easterntravel_makeup", :primary_key => "TRIP_ID", :force => true do |t|
    t.string "COMPANY_NAME", :limit => 40
    t.string "DEPART_CITY",  :limit => 40
    t.string "ARRIVE_CITY",  :limit => 40
    t.date   "DEPART_DATE"
  end

  create_table "gobus_makeup", :primary_key => "TRIP_ID", :force => true do |t|
    t.string "COMPANY_NAME", :limit => 40
    t.string "DEPART_CITY",  :limit => 40
    t.string "ARRIVE_CITY",  :limit => 40
    t.date   "DEPART_DATE"
  end

  create_table "greyhound_makeup", :primary_key => "TRIP_ID", :force => true do |t|
    t.string "COMPANY_NAME", :limit => 40
    t.string "DEPART_CITY",  :limit => 40
    t.string "ARRIVE_CITY",  :limit => 40
    t.date   "DEPART_DATE"
  end

  create_table "rides", :force => true do |t|
    t.string "from_city"
  end

end

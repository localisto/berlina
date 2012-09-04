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

ActiveRecord::Schema.define(:version => 20120904222314) do

  create_table "events", :force => true do |t|
    t.string   "external_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.decimal  "lat",              :precision => 15, :scale => 10
    t.decimal  "lng",              :precision => 15, :scale => 10
    t.string   "venue"
    t.string   "venue_extra"
    t.string   "address"
    t.string   "contact_name"
    t.string   "contact_position"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.integer  "organization_id"
  end

  add_index "events", ["external_id"], :name => "index_events_on_external_id", :unique => true
  add_index "events", ["organization_id"], :name => "index_events_on_organization_id"

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "hashtag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tweets", :force => true do |t|
    t.integer  "twitter_user_id"
    t.integer  "external_id",     :limit => 8
    t.string   "text"
    t.string   "image_url"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "tweets", ["twitter_user_id"], :name => "index_tweets_on_twitter_user_id"
                   ``
  create_table "twitter_users", :force => true do |t|
    t.integer  "external_id",       :limit => 8
    t.string   "username"
    t.string   "name"
    t.string   "profile_image_url"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

end

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

ActiveRecord::Schema.define(:version => 20120603201329) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "node_id"
    t.string   "comment_text"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "comments", ["node_id"], :name => "index_comments_on_node_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "nodes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "node_type"
    t.integer  "speaker_id"
    t.string   "node_text"
    t.integer  "previous_node_id"
    t.integer  "scenario_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "nodes", ["previous_node_id"], :name => "index_nodes_on_previous_node_id"
  add_index "nodes", ["scenario_id"], :name => "index_nodes_on_scenario_id"
  add_index "nodes", ["speaker_id"], :name => "index_nodes_on_speaker_id"
  add_index "nodes", ["user_id"], :name => "index_nodes_on_user_id"

  create_table "scenarios", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "speakers", :force => true do |t|
    t.integer  "scenario_id"
    t.string   "name"
    t.integer  "speaker_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "vote"
    t.integer  "user_id"
    t.integer  "node_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votes", ["node_id"], :name => "index_votes_on_node_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end

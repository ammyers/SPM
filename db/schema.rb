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

ActiveRecord::Schema.define(:version => 20141229210427) do

  create_table "completions", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "studytime_id"
  end

  create_table "courses", :force => true do |t|
    t.string   "section"
    t.string   "instructor"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "participant_studies", :id => false, :force => true do |t|
    t.integer "studytime_id"
    t.integer "user_id"
  end

  create_table "researcher_studies", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "study_id"
  end

  create_table "studentcourses", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "course_id"
  end

  create_table "studies", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "max_participants", :default => 30
    t.string   "duration"
    t.integer  "credits",          :default => 1
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "studytimes", :force => true do |t|
    t.datetime "datetime"
    t.string   "location"
    t.integer  "study_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "role"
    t.boolean  "setup",        :default => false
    t.integer  "credits",      :default => 0
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "member_of"
    t.boolean  "paper_option", :default => false
  end

end

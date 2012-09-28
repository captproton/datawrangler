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

ActiveRecord::Schema.define(:version => 20120927171126) do

  create_table "import_cells", :force => true do |t|
    t.integer  "import_table_id"
    t.integer  "row_index"
    t.integer  "column_index"
    t.string   "contents"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "import_cells", ["import_table_id"], :name => "index_import_cells_on_import_table_id"

  create_table "import_tables", :force => true do |t|
    t.string   "original_path"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "job_title"
    t.string   "company_name"
    t.string   "phone_number"
    t.string   "email_address"
    t.string   "lead_status"
    t.string   "lead_score"
    t.string   "response_type"
    t.string   "lead_source"
    t.string   "country"
    t.string   "industry"
    t.integer  "import_table_id"
    t.boolean  "disqualified",    :default => false
  end

  add_index "people", ["disqualified"], :name => "index_people_on_disqualified"
  add_index "people", ["import_table_id"], :name => "index_people_on_import_table_id"

  create_table "places", :force => true do |t|
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.date     "released_on"
    t.decimal  "price",       :precision => 2, :scale => 8
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

end

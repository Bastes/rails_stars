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

ActiveRecord::Schema.define(:version => 20120613102236) do

  create_table "rails_stars_anchors", :force => true do |t|
    t.string  "star_receiver_type"
    t.integer "star_receiver_id"
    t.float   "rating_average"
    t.integer "rating_count"
  end

  add_index "rails_stars_anchors", ["star_receiver_id"], :name => "index_rails_stars_anchors_on_star_receiver_id"
  add_index "rails_stars_anchors", ["star_receiver_type"], :name => "index_rails_stars_anchors_on_star_receiver_type"

  create_table "rails_stars_stars", :force => true do |t|
    t.string  "star_giver_type"
    t.integer "star_giver_id"
    t.integer "anchor_id"
    t.integer "rating"
  end

  add_index "rails_stars_stars", ["anchor_id"], :name => "index_rails_stars_stars_on_anchor_id"
  add_index "rails_stars_stars", ["star_giver_id"], :name => "index_rails_stars_stars_on_star_giver_id"
  add_index "rails_stars_stars", ["star_giver_type"], :name => "index_rails_stars_stars_on_star_giver_type"

  create_table "star_givers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "star_receivers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

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

ActiveRecord::Schema.define(:version => 20120612154624) do

  create_table "rails_stars_stars", :force => true do |t|
    t.integer "starrer_id"
    t.string  "starrer_type"
    t.integer "starred_id"
    t.string  "starred_type"
    t.integer "rating"
  end

  add_index "rails_stars_stars", ["rating"], :name => "index_rails_stars_stars_on_rating"
  add_index "rails_stars_stars", ["starred_id"], :name => "index_rails_stars_stars_on_starred_id"
  add_index "rails_stars_stars", ["starred_type"], :name => "index_rails_stars_stars_on_starred_type"
  add_index "rails_stars_stars", ["starrer_id"], :name => "index_rails_stars_stars_on_starrer_id"
  add_index "rails_stars_stars", ["starrer_type"], :name => "index_rails_stars_stars_on_starrer_type"

end

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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_01_151434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actor_movies", force: :cascade do |t|
    t.bigint "actor_id"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_actor_movies_on_actor_id"
    t.index ["movie_id"], name: "index_actor_movies_on_movie_id"
  end

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.boolean "currently_working"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amusement_parks", force: :cascade do |t|
    t.string "admissions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.integer "years_of_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mechanics_rides", force: :cascade do |t|
    t.bigint "mechanic_id"
    t.bigint "ride_id"
    t.index ["mechanic_id"], name: "index_mechanics_rides_on_mechanic_id"
    t.index ["ride_id"], name: "index_mechanics_rides_on_ride_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "creation_year"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "studio_id"
    t.index ["studio_id"], name: "index_movies_on_studio_id"
  end

  create_table "rides", force: :cascade do |t|
    t.string "name"
    t.integer "thrill_rating"
    t.boolean "open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "amusement_park_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "actor_movies", "actors"
  add_foreign_key "actor_movies", "movies"
  add_foreign_key "mechanics_rides", "mechanics"
  add_foreign_key "mechanics_rides", "rides"
  add_foreign_key "movies", "studios"
  add_foreign_key "rides", "amusement_parks", name: "rides_amusement_park_id_fkey"
end

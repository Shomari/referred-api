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

ActiveRecord::Schema.define(version: 20171003030015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "category"
    t.string "zipcode"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "business_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_recommendations_on_business_id"
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "referrals", force: :cascade do |t|
    t.integer "business_id"
    t.integer "referrer_id"
    t.integer "referred_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "facebook_uid"
    t.string "image_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_view "referral_payloads",  sql_definition: <<-SQL
      SELECT referrals.referrer_id,
      referrals.referred_id,
      referrer.name AS referrer_name,
      referrer.image_location AS referrer_image,
      referred.name AS referred_name,
      referred.image_location AS referred_location,
      businesses.name AS business_name,
      businesses.zipcode AS business_zipcode
     FROM (((referrals
       JOIN users referrer ON ((referrals.referrer_id = referrer.id)))
       JOIN users referred ON ((referrals.referred_id = referred.id)))
       JOIN businesses ON ((referrals.business_id = businesses.id)));
  SQL

end

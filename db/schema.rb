# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_27_185445) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'conversations', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'doctors', force: :cascade do |t|
    t.string 'place_id'
    t.string 'name'
    t.string 'photo'
    t.string 'formatted_address'
    t.float 'rating'
    t.integer 'user_ratings_total'
    t.string 'formatted_phone_number'
    t.float 'lat'
    t.float 'lng'
    t.string 'url'
    t.string 'website'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'favorites', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'doctor_id'
    t.string 'api_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[doctor_id], name: 'index_favorites_on_doctor_id'
    t.index %w[user_id], name: 'index_favorites_on_user_id'
  end

  create_table 'messages', force: :cascade do |t|
    t.string 'text'
    t.bigint 'conversation_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[conversation_id], name: 'index_messages_on_conversation_id'
  end

  create_table 'photos', force: :cascade do |t|
    t.bigint 'doctor_id'
    t.string 'photo_reference'
    t.string 'slug'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[doctor_id], name: 'index_photos_on_doctor_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.bigint 'doctor_id'
    t.string 'place_id'
    t.string 'author_name'
    t.string 'author_url'
    t.string 'profile_photo_url'
    t.integer 'rating'
    t.string 'relative_time_description'
    t.string 'text'
    t.integer 'time'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[doctor_id], name: 'index_reviews_on_doctor_id'
  end

  create_table 'searches', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.text 'csv'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[user_id], name: 'index_searches_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'password_digest'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'address'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'favorites', 'doctors'
  add_foreign_key 'favorites', 'users'
  add_foreign_key 'messages', 'conversations'
  add_foreign_key 'photos', 'doctors'
  add_foreign_key 'reviews', 'doctors'
  add_foreign_key 'searches', 'users'
end

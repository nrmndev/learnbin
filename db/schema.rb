# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_09_29_114818) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "collection_topics", force: :cascade do |t|
    t.bigint "collection_id", null: false
    t.bigint "topic_id", null: false
    t.integer "position"
    t.integer "visibility", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id", "topic_id"], name: "index_collection_topics_on_collection_id_and_topic_id"
    t.index ["collection_id"], name: "index_collection_topics_on_collection_id"
    t.index ["topic_id"], name: "index_collection_topics_on_topic_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug"
    t.text "description"
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.integer "visibility", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_collections_on_category_id"
    t.index ["slug"], name: "index_collections_on_slug", unique: true
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "slug"
    t.bigint "user_id", null: false
    t.integer "position"
    t.integer "visibility", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parts_on_user_id"
  end

  create_table "post_parts", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "part_id", null: false
    t.integer "position"
    t.integer "visibility", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_post_parts_on_part_id"
    t.index ["post_id", "part_id"], name: "index_post_parts_on_post_id_and_part_id"
    t.index ["post_id"], name: "index_post_parts_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug"
    t.text "description"
    t.bigint "user_id", null: false
    t.integer "position"
    t.integer "visibility", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_posts_on_slug"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "topic_posts", force: :cascade do |t|
    t.bigint "topic_id", null: false
    t.bigint "post_id", null: false
    t.integer "position"
    t.integer "visibility", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_topic_posts_on_post_id"
    t.index ["topic_id", "post_id"], name: "index_topic_posts_on_topic_id_and_post_id"
    t.index ["topic_id"], name: "index_topic_posts_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.bigint "user_id", null: false
    t.text "description"
    t.integer "position"
    t.integer "visibility", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "slug"], name: "index_topics_on_user_id_and_slug", unique: true
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "collection_topics", "collections"
  add_foreign_key "collection_topics", "topics"
  add_foreign_key "collections", "categories"
  add_foreign_key "collections", "users"
  add_foreign_key "parts", "users"
  add_foreign_key "post_parts", "parts"
  add_foreign_key "post_parts", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "topic_posts", "posts"
  add_foreign_key "topic_posts", "topics"
  add_foreign_key "topics", "users"
end

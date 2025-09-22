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

ActiveRecord::Schema[7.1].define(version: 2025_09_16_170721) do
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
    t.string "slug", null: false
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

  create_table "parts", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.integer "position"
    t.integer "visibility", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_parts_on_post_id"
    t.index ["user_id"], name: "index_parts_on_user_id"
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

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
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
    t.index ["slug"], name: "index_topics_on_slug"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "collection_topics", "collections"
  add_foreign_key "collection_topics", "topics"
  add_foreign_key "collections", "categories"
  add_foreign_key "collections", "users"
  add_foreign_key "parts", "posts"
  add_foreign_key "parts", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "taggings", "tags"
  add_foreign_key "topic_posts", "posts"
  add_foreign_key "topic_posts", "topics"
  add_foreign_key "topics", "users"
end

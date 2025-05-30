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

ActiveRecord::Schema[7.0].define(version: 2023_12_12_114923) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "equipment", force: :cascade do |t|
    t.string "title"
    t.string "manufacturer"
    t.string "part_number"
    t.text "description"
    t.integer "amount", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faq_tags", force: :cascade do |t|
    t.bigint "faq_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faq_id", "tag_id"], name: "index_faq_tags_on_faq_id_and_tag_id", unique: true
    t.index ["faq_id"], name: "index_faq_tags_on_faq_id"
    t.index ["tag_id"], name: "index_faq_tags_on_tag_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "rig_id"
    t.index ["rig_id"], name: "index_faqs_on_rig_id"
    t.index ["user_id"], name: "index_faqs_on_user_id"
  end

  create_table "phonebook_contacts", force: :cascade do |t|
    t.string "department"
    t.string "position"
    t.string "first_name"
    t.string "last_name"
    t.string "surname"
    t.string "landline_phone_1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "landline_phone_2"
    t.string "city_phone"
    t.string "work_mobile_phone"
    t.string "personal_mobile_phone_1"
    t.string "personal_mobile_phone_2"
  end

  create_table "rigs", force: :cascade do |t|
    t.string "rig_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tag_type", default: "tag_default"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "department", default: 0
    t.integer "position", default: 0
    t.string "phone", default: ""
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "faq_tags", "faqs"
  add_foreign_key "faq_tags", "tags"
  add_foreign_key "faqs", "rigs"
  add_foreign_key "faqs", "users"
end

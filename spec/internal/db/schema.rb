ActiveRecord::Schema.define do
  create_table "kms_users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.boolean  "alert",                  default: false, null: false
    t.index ["email"], name: "index_kms_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_kms_users_on_reset_password_token", unique: true, using: :btree
  end
end

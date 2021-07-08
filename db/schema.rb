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

ActiveRecord::Schema.define(version: 2021_07_08_040328) do

  create_table "movements", charset: "utf8", collation: "utf8_spanish_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "operation"
    t.integer "destinationAccount"
    t.bigint "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_movements_on_user_id"
  end

  create_table "users", charset: "utf8", collation: "utf8_spanish_ci", force: :cascade do |t|
    t.integer "accountNumber"
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.integer "age"
    t.bigint "phone", null: false
    t.bigint "balance", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accountNumber"], name: "index_users_on_accountNumber", unique: true
  end

  add_foreign_key "movements", "users"
end

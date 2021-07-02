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

ActiveRecord::Schema.define(version: 2021_03_21_142824) do

  create_table "comments", charset: "utf8", comment: "コメント", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "会員ID"
    t.bigint "post_id", null: false, comment: "投稿ID"
    t.text "body", comment: "内容"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "details", charset: "utf8", comment: "ユーザー詳細", force: :cascade do |t|
    t.integer "gender", default: 0, comment: "性別"
    t.date "birthday", comment: "誕生日"
    t.bigint "prefecture_id", comment: "居住地ID"
    t.bigint "genre_id", comment: "好きなお菓子ジャンル"
    t.string "image", comment: "アカウント画像"
    t.text "introduction", comment: "自己紹介"
    t.integer "house_hold_id", comment: "世帯"
    t.integer "frequency_id", comment: "お菓子を食べる頻度"
    t.integer "criteria_id", comment: "お菓子購入の基準"
    t.integer "pay_id", comment: "月のお菓子の出費"
    t.integer "current_work_id", comment: "現在のご職業"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.string "account_name", comment: "アカウント名"
    t.index ["genre_id"], name: "index_details_on_genre_id"
    t.index ["prefecture_id"], name: "index_details_on_prefecture_id"
  end

  create_table "genres", charset: "utf8", comment: "お菓子のジャンル", force: :cascade do |t|
    t.string "name", comment: "ジャンル名"
    t.integer "taste", default: 0, comment: "テイスト"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "likes", charset: "utf8", comment: "いいね", force: :cascade do |t|
    t.bigint "post_id", comment: "投稿ID"
    t.bigint "user_id", comment: "会員ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "posts", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "投稿ユーザー"
    t.string "title", comment: "タイトル"
    t.string "snack_name", null: false, comment: "お菓子の名前"
    t.text "body", comment: "内容"
    t.integer "where_to_buy_id", comment: "購入場所"
    t.string "image", comment: "画像"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "prefectures", charset: "utf8", force: :cascade do |t|
    t.string "name", comment: "都道府県名"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", null: false, comment: "メールアドレス"
    t.string "remember_token", comment: "トークン記憶"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "reset_token"
    t.datetime "reset_sent_at"
    t.datetime "deleted_at", comment: "削除日時"
    t.string "provider", comment: "プロバイダ"
    t.string "uid", comment: "SNSユーザーID"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "users"
end

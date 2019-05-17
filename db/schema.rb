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

ActiveRecord::Schema.define(version: 2019_05_17_133716) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "installs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_installs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true
  end

  create_table "meditations", force: :cascade do |t|
    t.string "title"
    t.string "tags"
    t.string "embed_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "begin_time"
    t.date "date"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.integer "conversation_id"
    t.integer "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string "title"
    t.string "mainimage"
    t.string "article_1"
    t.text "writeup_1"
    t.string "image_1"
    t.string "link_1"
    t.string "article_2"
    t.text "writeup_2"
    t.string "image_2"
    t.string "link_2"
    t.string "article_3"
    t.text "writeup_3"
    t.string "image_3"
    t.string "link_3"
    t.string "article_4"
    t.text "writeup_4"
    t.string "image_4"
    t.string "link_4"
    t.string "article_5"
    t.text "writeup_5"
    t.string "image_5"
    t.string "link_5"
    t.string "article_6"
    t.text "writeup_6"
    t.string "image_6"
    t.string "link_6"
    t.string "article_7"
    t.text "writeup_7"
    t.string "image_7"
    t.string "link_7"
    t.string "article_8"
    t.text "writeup_8"
    t.string "image_8"
    t.string "link_8"
    t.string "article_9"
    t.text "writeup_9"
    t.string "image_9"
    t.string "link_9"
    t.string "article_10"
    t.text "writeup_10"
    t.string "image_10"
    t.string "link_10"
    t.string "bonus_article_1"
    t.text "bonus_writeup_1"
    t.string "bonus_image_1"
    t.string "bonus_link_1"
    t.string "bonus_article_2"
    t.text "bonus_writeup_2"
    t.string "bonus_image_2"
    t.string "bonus_link_2"
    t.string "bonus_article_3"
    t.text "bonus_writeup_3"
    t.string "bonus_image_3"
    t.string "bonus_link_3"
    t.string "bonus_article_4"
    t.text "bonus_writeup_4"
    t.string "bonus_image_4"
    t.string "bonus_link_4"
    t.string "bonus_article_5"
    t.text "bonus_writeup_5"
    t.string "bonus_image_5"
    t.string "bonus_link_5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "newslettergif"
    t.string "gifwriteup"
    t.text "introduction"
    t.date "date"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cart_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "country"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_token"
    t.string "couponCode"
    t.integer "couponAmount"
    t.integer "coupon_id"
    t.integer "stripe_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "images"
    t.text "description"
    t.integer "price"
    t.string "collection_date"
    t.boolean "is_sold_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "images_2"
    t.string "images_3"
    t.integer "inventory"
    t.integer "price_with_tax"
    t.string "size"
  end

  create_table "thredded_categories", force: :cascade do |t|
    t.integer "messageboard_id", null: false
    t.text "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "slug", null: false
    t.index ["messageboard_id", "slug"], name: "index_thredded_categories_on_messageboard_id_and_slug", unique: true
    t.index ["messageboard_id"], name: "index_thredded_categories_on_messageboard_id"
    t.index ["name"], name: "thredded_categories_name_ci"
  end

  create_table "thredded_messageboard_groups", force: :cascade do |t|
    t.string "name"
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "thredded_messageboard_notifications_for_followed_topics", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "messageboard_id", null: false
    t.string "notifier_key", limit: 90, null: false
    t.boolean "enabled", default: true, null: false
    t.index ["user_id", "messageboard_id", "notifier_key"], name: "thredded_messageboard_notifications_for_followed_topics_unique", unique: true
  end

  create_table "thredded_messageboard_users", force: :cascade do |t|
    t.integer "thredded_user_detail_id", null: false
    t.integer "thredded_messageboard_id", null: false
    t.datetime "last_seen_at", null: false
    t.index ["thredded_messageboard_id", "last_seen_at"], name: "index_thredded_messageboard_users_for_recently_active"
    t.index ["thredded_messageboard_id", "thredded_user_detail_id"], name: "index_thredded_messageboard_users_primary", unique: true
  end

  create_table "thredded_messageboards", force: :cascade do |t|
    t.text "name", null: false
    t.text "slug"
    t.text "description"
    t.integer "topics_count", default: 0
    t.integer "posts_count", default: 0
    t.integer "position", null: false
    t.integer "last_topic_id"
    t.integer "messageboard_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "locked", default: false, null: false
    t.index ["messageboard_group_id"], name: "index_thredded_messageboards_on_messageboard_group_id"
    t.index ["slug"], name: "index_thredded_messageboards_on_slug", unique: true
  end

  create_table "thredded_notifications_for_followed_topics", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "notifier_key", limit: 90, null: false
    t.boolean "enabled", default: true, null: false
    t.index ["user_id", "notifier_key"], name: "thredded_notifications_for_followed_topics_unique", unique: true
  end

  create_table "thredded_notifications_for_private_topics", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "notifier_key", limit: 90, null: false
    t.boolean "enabled", default: true, null: false
    t.index ["user_id", "notifier_key"], name: "thredded_notifications_for_private_topics_unique", unique: true
  end

  create_table "thredded_post_moderation_records", force: :cascade do |t|
    t.integer "post_id"
    t.integer "messageboard_id"
    t.text "post_content", limit: 65535
    t.integer "post_user_id"
    t.text "post_user_name"
    t.integer "moderator_id"
    t.integer "moderation_state", null: false
    t.integer "previous_moderation_state", null: false
    t.datetime "created_at", null: false
    t.index ["messageboard_id", "created_at"], name: "index_thredded_moderation_records_for_display", order: { created_at: :desc }
  end

  create_table "thredded_posts", force: :cascade do |t|
    t.integer "user_id"
    t.text "content", limit: 65535
    t.string "source", limit: 191, default: "web"
    t.integer "postable_id", null: false
    t.integer "messageboard_id", null: false
    t.integer "moderation_state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["messageboard_id"], name: "index_thredded_posts_on_messageboard_id"
    t.index ["moderation_state", "updated_at"], name: "index_thredded_posts_for_display"
    t.index ["postable_id", "created_at"], name: "index_thredded_posts_on_postable_id_and_created_at"
    t.index ["postable_id"], name: "index_thredded_posts_on_postable_id"
    t.index ["user_id"], name: "index_thredded_posts_on_user_id"
  end

  create_table "thredded_private_posts", force: :cascade do |t|
    t.integer "user_id"
    t.text "content", limit: 65535
    t.integer "postable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["postable_id", "created_at"], name: "index_thredded_private_posts_on_postable_id_and_created_at"
  end

  create_table "thredded_private_topics", force: :cascade do |t|
    t.integer "user_id"
    t.integer "last_user_id"
    t.text "title", null: false
    t.text "slug", null: false
    t.integer "posts_count", default: 0
    t.string "hash_id", limit: 20, null: false
    t.datetime "last_post_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_thredded_private_topics_on_hash_id"
    t.index ["last_post_at"], name: "index_thredded_private_topics_on_last_post_at"
    t.index ["slug"], name: "index_thredded_private_topics_on_slug", unique: true
  end

  create_table "thredded_private_users", force: :cascade do |t|
    t.integer "private_topic_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["private_topic_id"], name: "index_thredded_private_users_on_private_topic_id"
    t.index ["user_id"], name: "index_thredded_private_users_on_user_id"
  end

  create_table "thredded_topic_categories", force: :cascade do |t|
    t.integer "topic_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_thredded_topic_categories_on_category_id"
    t.index ["topic_id"], name: "index_thredded_topic_categories_on_topic_id"
  end

  create_table "thredded_topics", force: :cascade do |t|
    t.integer "user_id"
    t.integer "last_user_id"
    t.text "title", null: false
    t.text "slug", null: false
    t.integer "messageboard_id", null: false
    t.integer "posts_count", default: 0, null: false
    t.boolean "sticky", default: false, null: false
    t.boolean "locked", default: false, null: false
    t.string "hash_id", limit: 20, null: false
    t.integer "moderation_state", null: false
    t.datetime "last_post_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_thredded_topics_on_hash_id"
    t.index ["last_post_at"], name: "index_thredded_topics_on_last_post_at"
    t.index ["messageboard_id"], name: "index_thredded_topics_on_messageboard_id"
    t.index ["moderation_state", "sticky", "updated_at"], name: "index_thredded_topics_for_display", order: { sticky: :desc, updated_at: :desc }
    t.index ["slug"], name: "index_thredded_topics_on_slug", unique: true
    t.index ["user_id"], name: "index_thredded_topics_on_user_id"
  end

  create_table "thredded_user_details", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "latest_activity_at"
    t.integer "posts_count", default: 0
    t.integer "topics_count", default: 0
    t.datetime "last_seen_at"
    t.integer "moderation_state", default: 0, null: false
    t.datetime "moderation_state_changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latest_activity_at"], name: "index_thredded_user_details_on_latest_activity_at"
    t.index ["moderation_state", "moderation_state_changed_at"], name: "index_thredded_user_details_for_moderations", order: { moderation_state_changed_at: :desc }
    t.index ["user_id"], name: "index_thredded_user_details_on_user_id", unique: true
  end

  create_table "thredded_user_messageboard_preferences", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "messageboard_id", null: false
    t.boolean "follow_topics_on_mention", default: true, null: false
    t.boolean "auto_follow_topics", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "messageboard_id"], name: "thredded_user_messageboard_preferences_user_id_messageboard_id", unique: true
  end

  create_table "thredded_user_post_notifications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "notified_at", null: false
    t.index ["post_id"], name: "index_thredded_user_post_notifications_on_post_id"
    t.index ["user_id", "post_id"], name: "index_thredded_user_post_notifications_on_user_id_and_post_id", unique: true
  end

  create_table "thredded_user_preferences", force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "follow_topics_on_mention", default: true, null: false
    t.boolean "auto_follow_topics", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_thredded_user_preferences_on_user_id", unique: true
  end

  create_table "thredded_user_private_topic_read_states", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "postable_id", null: false
    t.integer "unread_posts_count", default: 0, null: false
    t.integer "read_posts_count", default: 0, null: false
    t.integer "integer", default: 0, null: false
    t.datetime "read_at", null: false
    t.index ["user_id", "postable_id"], name: "thredded_user_private_topic_read_states_user_postable", unique: true
  end

  create_table "thredded_user_topic_follows", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "topic_id", null: false
    t.datetime "created_at", null: false
    t.integer "reason", limit: 1
    t.index ["user_id", "topic_id"], name: "thredded_user_topic_follows_user_topic", unique: true
  end

  create_table "thredded_user_topic_read_states", force: :cascade do |t|
    t.integer "messageboard_id", null: false
    t.integer "user_id", null: false
    t.integer "postable_id", null: false
    t.integer "unread_posts_count", default: 0, null: false
    t.integer "read_posts_count", default: 0, null: false
    t.integer "integer", default: 0, null: false
    t.datetime "read_at", null: false
    t.index ["messageboard_id"], name: "index_thredded_user_topic_read_states_on_messageboard_id"
    t.index ["user_id", "messageboard_id"], name: "thredded_user_topic_read_states_user_messageboard"
    t.index ["user_id", "postable_id"], name: "thredded_user_topic_read_states_user_postable", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "country"
    t.string "postal_code"
    t.string "ig_username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "password_digest"
    t.string "subscription_plan"
    t.boolean "is_subscription_active", default: true
    t.string "stripe_customer"
    t.string "stripe_token"
    t.string "stripe_subscription"
    t.string "coupon"
    t.string "photo"
    t.string "photogif"
    t.integer "tune_in"
    t.string "MHSquote_1"
    t.string "MHSquote_2"
    t.string "MHSquote_3"
    t.string "MHSbook_1"
    t.string "MHSbook_2"
    t.string "MHSbook_3"
    t.string "MHSbook_4"
    t.string "MHSbook_5"
    t.string "MHSIG_1"
    t.string "MHSIG_2"
    t.string "MHSIG_3"
    t.string "MHSIG_4"
    t.string "MHSIG_5"
    t.string "MHSproduct_1"
    t.string "MHSroduct_2"
    t.string "MHSproduct_3"
    t.string "MHSproduct_4"
    t.string "MHSproduct_5"
    t.string "MHSroutine_1"
    t.string "MHSroutine_2"
    t.string "MHSroutine_3"
    t.string "MHSgeneral_1"
    t.string "MHSgeneral_3"
    t.string "MHSgeneral_4"
    t.string "MHSgeneral_5"
    t.integer "points"
    t.string "stripe_card_token"
    t.float "latitude"
    t.float "longitude"
    t.string "meme_1"
    t.string "meme_2"
    t.string "meme_3"
    t.string "meme_4"
    t.string "meme_5"
    t.string "meme_6"
    t.string "meme_7"
    t.string "meme_8"
    t.string "personalIG_link"
    t.string "IG_link1"
    t.string "IG_link2"
    t.string "IG_link3"
    t.string "IG_link4"
    t.string "IG_link5"
    t.string "video_links1"
    t.string "vide_links2"
    t.string "vide_links3"
    t.string "vide_links4"
    t.string "product_1"
    t.string "product_2"
    t.string "product_3"
    t.string "product_4"
    t.string "product_5"
    t.string "spotify_profile"
    t.text "about"
    t.boolean "admin"
    t.string "referral_code"
    t.index ["ig_username"], name: "ig_username_nocase", unique: true
  end

end

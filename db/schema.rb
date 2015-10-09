# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140102194802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "pg_trgm"

  create_table "api_keys", force: :cascade do |t|
    t.string   "key",           limit: 64, null: false
    t.integer  "user_id"
    t.integer  "created_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["key"], name: "index_api_keys_on_key", using: :btree
  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id", unique: true, using: :btree

  create_table "cas_user_infos", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.string   "cas_user_id", limit: 255, null: false
    t.string   "username",    limit: 255, null: false
    t.string   "first_name",  limit: 255
    t.string   "last_name",   limit: 255
    t.string   "email",       limit: 255
    t.string   "gender",      limit: 255
    t.string   "name",        limit: 255
    t.string   "link",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cas_user_infos", ["cas_user_id"], name: "index_cas_user_infos_on_cas_user_id", unique: true, using: :btree
  add_index "cas_user_infos", ["user_id"], name: "index_cas_user_infos_on_user_id", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",               limit: 50,                     null: false
    t.string   "color",              limit: 6,   default: "AB9364", null: false
    t.integer  "topic_id"
    t.integer  "topic_count",                    default: 0,        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                                           null: false
    t.integer  "topics_year"
    t.integer  "topics_month"
    t.integer  "topics_week"
    t.string   "slug",               limit: 255,                    null: false
    t.text     "description"
    t.string   "text_color",         limit: 6,   default: "FFFFFF", null: false
    t.float    "hotness",                        default: 5.0,      null: false
    t.boolean  "read_restricted",                default: false,    null: false
    t.float    "auto_close_hours"
    t.integer  "post_count",                     default: 0,        null: false
    t.integer  "latest_post_id"
    t.integer  "latest_topic_id"
    t.integer  "position"
    t.integer  "parent_category_id"
    t.integer  "posts_year"
    t.integer  "posts_month"
    t.integer  "posts_week"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree
  add_index "categories", ["topic_count"], name: "index_categories_on_topic_count", using: :btree

  create_table "category_featured_topics", force: :cascade do |t|
    t.integer  "category_id",             null: false
    t.integer  "topic_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank",        default: 0, null: false
  end

  add_index "category_featured_topics", ["category_id", "rank"], name: "index_category_featured_topics_on_category_id_and_rank", using: :btree
  add_index "category_featured_topics", ["category_id", "topic_id"], name: "cat_featured_threads", unique: true, using: :btree

  create_table "category_featured_users", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_featured_users", ["category_id", "user_id"], name: "index_category_featured_users_on_category_id_and_user_id", unique: true, using: :btree

  create_table "category_groups", force: :cascade do |t|
    t.integer  "category_id",                 null: false
    t.integer  "group_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "permission_type", default: 1
  end

  create_table "category_search_data", primary_key: "category_id", force: :cascade do |t|
    t.tsvector "search_data"
  end

  add_index "category_search_data", ["search_data"], name: "idx_search_category", using: :gin

  create_table "category_users", force: :cascade do |t|
    t.integer "category_id",        null: false
    t.integer "user_id",            null: false
    t.integer "notification_level", null: false
  end

  create_table "draft_sequences", force: :cascade do |t|
    t.integer "user_id",               null: false
    t.string  "draft_key", limit: 255, null: false
    t.integer "sequence",              null: false
  end

  add_index "draft_sequences", ["user_id", "draft_key"], name: "index_draft_sequences_on_user_id_and_draft_key", unique: true, using: :btree

  create_table "drafts", force: :cascade do |t|
    t.integer  "user_id",                            null: false
    t.string   "draft_key",  limit: 255,             null: false
    t.text     "data",                               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sequence",               default: 0, null: false
  end

  add_index "drafts", ["user_id", "draft_key"], name: "index_drafts_on_user_id_and_draft_key", using: :btree

  create_table "email_logs", force: :cascade do |t|
    t.string   "to_address", limit: 255, null: false
    t.string   "email_type", limit: 255, null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reply_key",  limit: 32
    t.integer  "post_id"
    t.integer  "topic_id"
  end

  add_index "email_logs", ["created_at"], name: "index_email_logs_on_created_at", order: {"created_at"=>:desc}, using: :btree
  add_index "email_logs", ["reply_key"], name: "index_email_logs_on_reply_key", using: :btree
  add_index "email_logs", ["user_id", "created_at"], name: "index_email_logs_on_user_id_and_created_at", order: {"created_at"=>:desc}, using: :btree

  create_table "email_tokens", force: :cascade do |t|
    t.integer  "user_id",                                null: false
    t.string   "email",      limit: 255,                 null: false
    t.string   "token",      limit: 255,                 null: false
    t.boolean  "confirmed",              default: false, null: false
    t.boolean  "expired",                default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "email_tokens", ["token"], name: "index_email_tokens_on_token", unique: true, using: :btree

  create_table "facebook_user_infos", force: :cascade do |t|
    t.integer  "user_id",                      null: false
    t.integer  "facebook_user_id", limit: 8,   null: false
    t.string   "username",         limit: 255, null: false
    t.string   "first_name",       limit: 255
    t.string   "last_name",        limit: 255
    t.string   "email",            limit: 255
    t.string   "gender",           limit: 255
    t.string   "name",             limit: 255
    t.string   "link",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facebook_user_infos", ["facebook_user_id"], name: "index_facebook_user_infos_on_facebook_user_id", unique: true, using: :btree
  add_index "facebook_user_infos", ["user_id"], name: "index_facebook_user_infos_on_user_id", unique: true, using: :btree

  create_table "github_user_infos", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.string   "screen_name",    limit: 255, null: false
    t.integer  "github_user_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "github_user_infos", ["github_user_id"], name: "index_github_user_infos_on_github_user_id", unique: true, using: :btree
  add_index "github_user_infos", ["user_id"], name: "index_github_user_infos_on_user_id", unique: true, using: :btree

  create_table "group_users", force: :cascade do |t|
    t.integer  "group_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_users", ["group_id", "user_id"], name: "index_group_users_on_group_id_and_user_id", unique: true, using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255,                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "automatic",              default: false, null: false
    t.integer  "user_count",             default: 0,     null: false
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true, using: :btree

  create_table "hot_topics", force: :cascade do |t|
    t.integer "topic_id",            null: false
    t.integer "category_id"
    t.float   "score",               null: false
    t.float   "random_bias"
    t.float   "random_multiplier"
    t.float   "days_ago_bias"
    t.float   "days_ago_multiplier"
    t.integer "hot_topic_type"
  end

  add_index "hot_topics", ["score"], name: "index_hot_topics_on_score", order: {"score"=>:desc}, using: :btree
  add_index "hot_topics", ["topic_id"], name: "index_hot_topics_on_topic_id", unique: true, using: :btree

  create_table "incoming_links", force: :cascade do |t|
    t.string   "url",             limit: 1000, null: false
    t.string   "referer",         limit: 1000
    t.string   "domain",          limit: 100
    t.integer  "topic_id"
    t.integer  "post_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.inet     "ip_address"
    t.integer  "current_user_id"
  end

  add_index "incoming_links", ["created_at", "domain"], name: "index_incoming_links_on_created_at_and_domain", using: :btree
  add_index "incoming_links", ["created_at", "user_id"], name: "index_incoming_links_on_created_at_and_user_id", using: :btree
  add_index "incoming_links", ["topic_id", "post_number"], name: "incoming_index", using: :btree

  create_table "invites", force: :cascade do |t|
    t.string   "invite_key",    limit: 32,  null: false
    t.string   "email",         limit: 255, null: false
    t.integer  "invited_by_id",             null: false
    t.integer  "user_id"
    t.datetime "redeemed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "deleted_by_id"
  end

  add_index "invites", ["email", "invited_by_id"], name: "index_invites_on_email_and_invited_by_id", unique: true, using: :btree
  add_index "invites", ["invite_key"], name: "index_invites_on_invite_key", unique: true, using: :btree

  create_table "message_bus", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "context",    limit: 255
    t.text     "data"
    t.datetime "created_at"
  end

  add_index "message_bus", ["created_at"], name: "index_message_bus_on_created_at", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.integer  "notification_type",                              null: false
    t.integer  "user_id",                                        null: false
    t.string   "data",              limit: 1000,                 null: false
    t.boolean  "read",                           default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topic_id"
    t.integer  "post_number"
    t.integer  "post_action_id"
  end

  add_index "notifications", ["post_action_id"], name: "index_notifications_on_post_action_id", using: :btree
  add_index "notifications", ["user_id", "created_at"], name: "index_notifications_on_user_id_and_created_at", using: :btree

  create_table "oauth2_user_infos", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.string   "uid",        limit: 255, null: false
    t.string   "provider",   limit: 255, null: false
    t.string   "email",      limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth2_user_infos", ["uid", "provider"], name: "index_oauth2_user_infos_on_uid_and_provider", unique: true, using: :btree

  create_table "optimized_images", force: :cascade do |t|
    t.string  "sha1",      limit: 40,  null: false
    t.string  "extension", limit: 10,  null: false
    t.integer "width",                 null: false
    t.integer "height",                null: false
    t.integer "upload_id",             null: false
    t.string  "url",       limit: 255, null: false
  end

  add_index "optimized_images", ["upload_id", "width", "height"], name: "index_optimized_images_on_upload_id_and_width_and_height", unique: true, using: :btree
  add_index "optimized_images", ["upload_id"], name: "index_optimized_images_on_upload_id", using: :btree

  create_table "plugin_store_rows", force: :cascade do |t|
    t.string "plugin_name", limit: 255, null: false
    t.string "key",         limit: 255, null: false
    t.string "type_name",   limit: 255, null: false
    t.text   "value"
  end

  add_index "plugin_store_rows", ["plugin_name", "key"], name: "index_plugin_store_rows_on_plugin_name_and_key", unique: true, using: :btree

  create_table "post_action_types", force: :cascade do |t|
    t.string   "name_key",   limit: 50,                 null: false
    t.boolean  "is_flag",               default: false, null: false
    t.string   "icon",       limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",              default: 0,     null: false
  end

  create_table "post_actions", force: :cascade do |t|
    t.integer  "post_id",                             null: false
    t.integer  "user_id",                             null: false
    t.integer  "post_action_type_id",                 null: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deleted_by_id"
    t.text     "message"
    t.integer  "related_post_id"
    t.boolean  "staff_took_action",   default: false, null: false
    t.boolean  "defer"
    t.integer  "defer_by"
  end

  add_index "post_actions", ["post_id"], name: "index_post_actions_on_post_id", using: :btree
  add_index "post_actions", ["user_id", "post_action_type_id", "post_id", "deleted_at"], name: "idx_unique_actions", unique: true, using: :btree

  create_table "post_details", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "key",        limit: 255
    t.string   "value",      limit: 255
    t.text     "extra"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_details", ["post_id", "key"], name: "index_post_details_on_post_id_and_key", unique: true, using: :btree

  create_table "post_replies", id: false, force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "reply_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_replies", ["post_id", "reply_id"], name: "index_post_replies_on_post_id_and_reply_id", unique: true, using: :btree

  create_table "post_revisions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "modifications"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_revisions", ["post_id", "number"], name: "index_post_revisions_on_post_id_and_number", using: :btree
  add_index "post_revisions", ["post_id"], name: "index_post_revisions_on_post_id", using: :btree

  create_table "post_search_data", primary_key: "post_id", force: :cascade do |t|
    t.tsvector "search_data"
  end

  add_index "post_search_data", ["search_data"], name: "idx_search_post", using: :gin

  create_table "post_timings", id: false, force: :cascade do |t|
    t.integer "topic_id",    null: false
    t.integer "post_number", null: false
    t.integer "user_id",     null: false
    t.integer "msecs",       null: false
  end

  add_index "post_timings", ["topic_id", "post_number", "user_id"], name: "post_timings_unique", unique: true, using: :btree
  add_index "post_timings", ["topic_id", "post_number"], name: "post_timings_summary", using: :btree

  create_table "post_uploads", force: :cascade do |t|
    t.integer "post_id",   null: false
    t.integer "upload_id", null: false
  end

  add_index "post_uploads", ["post_id", "upload_id"], name: "idx_unique_post_uploads", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "topic_id",                                            null: false
    t.integer  "post_number",                                         null: false
    t.text     "raw",                                                 null: false
    t.text     "cooked",                                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reply_to_post_number"
    t.integer  "reply_count",                         default: 0,     null: false
    t.integer  "quote_count",                         default: 0,     null: false
    t.datetime "deleted_at"
    t.integer  "off_topic_count",                     default: 0,     null: false
    t.integer  "like_count",                          default: 0,     null: false
    t.integer  "incoming_link_count",                 default: 0,     null: false
    t.integer  "bookmark_count",                      default: 0,     null: false
    t.integer  "avg_time"
    t.float    "score"
    t.integer  "reads",                               default: 0,     null: false
    t.integer  "post_type",                           default: 1,     null: false
    t.integer  "vote_count",                          default: 0,     null: false
    t.integer  "sort_order"
    t.integer  "last_editor_id"
    t.boolean  "hidden",                              default: false, null: false
    t.integer  "hidden_reason_id"
    t.integer  "notify_moderators_count",             default: 0,     null: false
    t.integer  "spam_count",                          default: 0,     null: false
    t.integer  "illegal_count",                       default: 0,     null: false
    t.integer  "inappropriate_count",                 default: 0,     null: false
    t.datetime "last_version_at",                                     null: false
    t.boolean  "user_deleted",                        default: false, null: false
    t.integer  "reply_to_user_id"
    t.float    "percent_rank",                        default: 1.0
    t.integer  "notify_user_count",                   default: 0,     null: false
    t.integer  "like_score",                          default: 0,     null: false
    t.integer  "deleted_by_id"
    t.string   "edit_reason",             limit: 255
    t.integer  "word_count"
    t.integer  "version",                             default: 1,     null: false
    t.integer  "cook_method",                         default: 1,     null: false
  end

  add_index "posts", ["reply_to_post_number"], name: "index_posts_on_reply_to_post_number", using: :btree
  add_index "posts", ["topic_id", "post_number"], name: "index_posts_on_topic_id_and_post_number", using: :btree
  add_index "posts", ["user_id"], name: "idx_posts_user_id_deleted_at", where: "(deleted_at IS NULL)", using: :btree

  create_table "screened_emails", force: :cascade do |t|
    t.string   "email",         limit: 255,             null: false
    t.integer  "action_type",                           null: false
    t.integer  "match_count",               default: 0, null: false
    t.datetime "last_match_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.inet     "ip_address"
  end

  add_index "screened_emails", ["email"], name: "index_screened_emails_on_email", unique: true, using: :btree
  add_index "screened_emails", ["last_match_at"], name: "index_screened_emails_on_last_match_at", using: :btree

  create_table "screened_ip_addresses", force: :cascade do |t|
    t.inet     "ip_address",                null: false
    t.integer  "action_type",               null: false
    t.integer  "match_count",   default: 0, null: false
    t.datetime "last_match_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "screened_ip_addresses", ["ip_address"], name: "index_screened_ip_addresses_on_ip_address", unique: true, using: :btree
  add_index "screened_ip_addresses", ["last_match_at"], name: "index_screened_ip_addresses_on_last_match_at", using: :btree

  create_table "screened_urls", force: :cascade do |t|
    t.string   "url",           limit: 255,             null: false
    t.string   "domain",        limit: 255,             null: false
    t.integer  "action_type",                           null: false
    t.integer  "match_count",               default: 0, null: false
    t.datetime "last_match_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.inet     "ip_address"
  end

  add_index "screened_urls", ["last_match_at"], name: "index_screened_urls_on_last_match_at", using: :btree
  add_index "screened_urls", ["url"], name: "index_screened_urls_on_url", unique: true, using: :btree

  create_table "site_contents", id: false, force: :cascade do |t|
    t.string   "content_type", limit: 255, null: false
    t.text     "content",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_contents", ["content_type"], name: "index_site_contents_on_content_type", unique: true, using: :btree

  create_table "site_customizations", force: :cascade do |t|
    t.string   "name",                    limit: 255,                 null: false
    t.text     "stylesheet"
    t.text     "header"
    t.integer  "position",                                            null: false
    t.integer  "user_id",                                             null: false
    t.boolean  "enabled",                                             null: false
    t.string   "key",                     limit: 255,                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "override_default_style",              default: false, null: false
    t.text     "stylesheet_baked",                    default: "",    null: false
    t.text     "mobile_stylesheet"
    t.text     "mobile_header"
    t.text     "mobile_stylesheet_baked"
  end

  add_index "site_customizations", ["key"], name: "index_site_customizations_on_key", using: :btree

  create_table "site_settings", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "data_type",              null: false
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "top_topics", force: :cascade do |t|
    t.integer "topic_id"
    t.integer "yearly_posts_count",  default: 0, null: false
    t.integer "yearly_views_count",  default: 0, null: false
    t.integer "yearly_likes_count",  default: 0, null: false
    t.integer "monthly_posts_count", default: 0, null: false
    t.integer "monthly_views_count", default: 0, null: false
    t.integer "monthly_likes_count", default: 0, null: false
    t.integer "weekly_posts_count",  default: 0, null: false
    t.integer "weekly_views_count",  default: 0, null: false
    t.integer "weekly_likes_count",  default: 0, null: false
    t.integer "daily_posts_count",   default: 0, null: false
    t.integer "daily_views_count",   default: 0, null: false
    t.integer "daily_likes_count",   default: 0, null: false
    t.float   "yearly_score"
    t.float   "monthly_score"
    t.float   "weekly_score"
    t.float   "daily_score"
  end

  add_index "top_topics", ["daily_likes_count"], name: "index_top_topics_on_daily_likes_count", order: {"daily_likes_count"=>:desc}, using: :btree
  add_index "top_topics", ["daily_posts_count"], name: "index_top_topics_on_daily_posts_count", order: {"daily_posts_count"=>:desc}, using: :btree
  add_index "top_topics", ["daily_views_count"], name: "index_top_topics_on_daily_views_count", order: {"daily_views_count"=>:desc}, using: :btree
  add_index "top_topics", ["monthly_likes_count"], name: "index_top_topics_on_monthly_likes_count", order: {"monthly_likes_count"=>:desc}, using: :btree
  add_index "top_topics", ["monthly_posts_count"], name: "index_top_topics_on_monthly_posts_count", order: {"monthly_posts_count"=>:desc}, using: :btree
  add_index "top_topics", ["monthly_views_count"], name: "index_top_topics_on_monthly_views_count", order: {"monthly_views_count"=>:desc}, using: :btree
  add_index "top_topics", ["topic_id"], name: "index_top_topics_on_topic_id", unique: true, using: :btree
  add_index "top_topics", ["weekly_likes_count"], name: "index_top_topics_on_weekly_likes_count", order: {"weekly_likes_count"=>:desc}, using: :btree
  add_index "top_topics", ["weekly_posts_count"], name: "index_top_topics_on_weekly_posts_count", order: {"weekly_posts_count"=>:desc}, using: :btree
  add_index "top_topics", ["weekly_views_count"], name: "index_top_topics_on_weekly_views_count", order: {"weekly_views_count"=>:desc}, using: :btree
  add_index "top_topics", ["yearly_likes_count"], name: "index_top_topics_on_yearly_likes_count", order: {"yearly_likes_count"=>:desc}, using: :btree
  add_index "top_topics", ["yearly_posts_count"], name: "index_top_topics_on_yearly_posts_count", order: {"yearly_posts_count"=>:desc}, using: :btree
  add_index "top_topics", ["yearly_views_count"], name: "index_top_topics_on_yearly_views_count", order: {"yearly_views_count"=>:desc}, using: :btree

  create_table "topic_allowed_groups", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "topic_id", null: false
  end

  add_index "topic_allowed_groups", ["group_id", "topic_id"], name: "index_topic_allowed_groups_on_group_id_and_topic_id", unique: true, using: :btree
  add_index "topic_allowed_groups", ["topic_id", "group_id"], name: "index_topic_allowed_groups_on_topic_id_and_group_id", unique: true, using: :btree

  create_table "topic_allowed_users", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "topic_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topic_allowed_users", ["topic_id", "user_id"], name: "index_topic_allowed_users_on_topic_id_and_user_id", unique: true, using: :btree
  add_index "topic_allowed_users", ["user_id", "topic_id"], name: "index_topic_allowed_users_on_user_id_and_topic_id", unique: true, using: :btree

  create_table "topic_embeds", force: :cascade do |t|
    t.integer  "topic_id",                 null: false
    t.integer  "post_id",                  null: false
    t.string   "embed_url",    limit: 255, null: false
    t.string   "content_sha1", limit: 40,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topic_embeds", ["embed_url"], name: "index_topic_embeds_on_embed_url", unique: true, using: :btree

  create_table "topic_invites", force: :cascade do |t|
    t.integer  "topic_id",   null: false
    t.integer  "invite_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topic_invites", ["invite_id"], name: "index_topic_invites_on_invite_id", using: :btree
  add_index "topic_invites", ["topic_id", "invite_id"], name: "index_topic_invites_on_topic_id_and_invite_id", unique: true, using: :btree

  create_table "topic_link_clicks", force: :cascade do |t|
    t.integer  "topic_link_id", null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.inet     "ip_address",    null: false
  end

  add_index "topic_link_clicks", ["topic_link_id"], name: "by_link", using: :btree

  create_table "topic_links", force: :cascade do |t|
    t.integer  "topic_id",                                  null: false
    t.integer  "post_id"
    t.integer  "user_id",                                   null: false
    t.string   "url",           limit: 500,                 null: false
    t.string   "domain",        limit: 100,                 null: false
    t.boolean  "internal",                  default: false, null: false
    t.integer  "link_topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "reflection",                default: false
    t.integer  "clicks",                    default: 0,     null: false
    t.integer  "link_post_id"
  end

  add_index "topic_links", ["topic_id", "post_id", "url"], name: "unique_post_links", unique: true, using: :btree
  add_index "topic_links", ["topic_id"], name: "index_topic_links_on_topic_id", using: :btree

  create_table "topic_revisions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "modifications"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topic_revisions", ["topic_id", "number"], name: "index_topic_revisions_on_topic_id_and_number", using: :btree
  add_index "topic_revisions", ["topic_id"], name: "index_topic_revisions_on_topic_id", using: :btree

  create_table "topic_users", force: :cascade do |t|
    t.integer  "user_id",                                  null: false
    t.integer  "topic_id",                                 null: false
    t.boolean  "starred",                  default: false, null: false
    t.boolean  "posted",                   default: false, null: false
    t.integer  "last_read_post_number"
    t.integer  "seen_post_count"
    t.datetime "starred_at"
    t.datetime "last_visited_at"
    t.datetime "first_visited_at"
    t.integer  "notification_level",       default: 1,     null: false
    t.datetime "notifications_changed_at"
    t.integer  "notifications_reason_id"
    t.integer  "total_msecs_viewed",       default: 0,     null: false
    t.datetime "cleared_pinned_at"
    t.datetime "unstarred_at"
    t.integer  "last_emailed_post_number"
  end

  add_index "topic_users", ["topic_id", "user_id"], name: "index_topic_users_on_topic_id_and_user_id", unique: true, using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "title",                   limit: 255,                     null: false
    t.datetime "last_posted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "views",                               default: 0,         null: false
    t.integer  "posts_count",                         default: 0,         null: false
    t.integer  "user_id"
    t.integer  "last_post_user_id",                                       null: false
    t.integer  "reply_count",                         default: 0,         null: false
    t.integer  "featured_user1_id"
    t.integer  "featured_user2_id"
    t.integer  "featured_user3_id"
    t.integer  "avg_time"
    t.datetime "deleted_at"
    t.integer  "highest_post_number",                 default: 0,         null: false
    t.string   "image_url",               limit: 255
    t.integer  "off_topic_count",                     default: 0,         null: false
    t.integer  "like_count",                          default: 0,         null: false
    t.integer  "incoming_link_count",                 default: 0,         null: false
    t.integer  "bookmark_count",                      default: 0,         null: false
    t.integer  "star_count",                          default: 0,         null: false
    t.integer  "category_id"
    t.boolean  "visible",                             default: true,      null: false
    t.integer  "moderator_posts_count",               default: 0,         null: false
    t.boolean  "closed",                              default: false,     null: false
    t.boolean  "archived",                            default: false,     null: false
    t.datetime "bumped_at",                                               null: false
    t.boolean  "has_summary",                         default: false,     null: false
    t.hstore   "meta_data"
    t.integer  "vote_count",                          default: 0,         null: false
    t.string   "archetype",               limit: 255, default: "regular", null: false
    t.integer  "featured_user4_id"
    t.integer  "notify_moderators_count",             default: 0,         null: false
    t.integer  "spam_count",                          default: 0,         null: false
    t.integer  "illegal_count",                       default: 0,         null: false
    t.integer  "inappropriate_count",                 default: 0,         null: false
    t.datetime "pinned_at"
    t.float    "score"
    t.float    "percent_rank",                        default: 1.0,       null: false
    t.integer  "notify_user_count",                   default: 0,         null: false
    t.string   "subtype",                 limit: 255
    t.string   "slug",                    limit: 255
    t.datetime "auto_close_at"
    t.integer  "auto_close_user_id"
    t.datetime "auto_close_started_at"
    t.integer  "deleted_by_id"
    t.integer  "participant_count",                   default: 1
    t.integer  "word_count"
  end

  add_index "topics", ["bumped_at"], name: "index_topics_on_bumped_at", order: {"bumped_at"=>:desc}, using: :btree
  add_index "topics", ["deleted_at", "visible", "archetype", "id"], name: "index_topics_on_deleted_at_and_visible_and_archetype_and_id", using: :btree
  add_index "topics", ["id", "deleted_at"], name: "index_topics_on_id_and_deleted_at", using: :btree
  add_index "topics", ["user_id"], name: "idx_topics_user_id_deleted_at", where: "(deleted_at IS NULL)", using: :btree

  create_table "twitter_user_infos", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.string   "screen_name",     limit: 255, null: false
    t.integer  "twitter_user_id", limit: 8,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "twitter_user_infos", ["twitter_user_id"], name: "index_twitter_user_infos_on_twitter_user_id", unique: true, using: :btree
  add_index "twitter_user_infos", ["user_id"], name: "index_twitter_user_infos_on_user_id", unique: true, using: :btree

  create_table "uploads", force: :cascade do |t|
    t.integer  "user_id",                        null: false
    t.string   "original_filename", limit: 255,  null: false
    t.integer  "filesize",                       null: false
    t.integer  "width"
    t.integer  "height"
    t.string   "url",               limit: 255,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sha1",              limit: 40
    t.string   "origin",            limit: 1000
  end

  add_index "uploads", ["id", "url"], name: "index_uploads_on_id_and_url", using: :btree
  add_index "uploads", ["sha1"], name: "index_uploads_on_sha1", unique: true, using: :btree
  add_index "uploads", ["url"], name: "index_uploads_on_url", using: :btree
  add_index "uploads", ["user_id"], name: "index_uploads_on_user_id", using: :btree

  create_table "user_actions", force: :cascade do |t|
    t.integer  "action_type",     null: false
    t.integer  "user_id",         null: false
    t.integer  "target_topic_id"
    t.integer  "target_post_id"
    t.integer  "target_user_id"
    t.integer  "acting_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_actions", ["acting_user_id"], name: "index_user_actions_on_acting_user_id", using: :btree
  add_index "user_actions", ["action_type", "user_id", "target_topic_id", "target_post_id", "acting_user_id"], name: "idx_unique_rows", unique: true, using: :btree
  add_index "user_actions", ["user_id", "action_type"], name: "index_user_actions_on_user_id_and_action_type", using: :btree

  create_table "user_histories", force: :cascade do |t|
    t.integer  "action",                     null: false
    t.integer  "acting_user_id"
    t.integer  "target_user_id"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "context",        limit: 255
    t.string   "ip_address",     limit: 255
    t.string   "email",          limit: 255
    t.text     "subject"
    t.text     "previous_value"
    t.text     "new_value"
    t.integer  "topic_id"
  end

  add_index "user_histories", ["acting_user_id", "action", "id"], name: "index_user_histories_on_acting_user_id_and_action_and_id", using: :btree
  add_index "user_histories", ["action", "id"], name: "index_user_histories_on_action_and_id", using: :btree
  add_index "user_histories", ["subject", "id"], name: "index_user_histories_on_subject_and_id", using: :btree
  add_index "user_histories", ["target_user_id", "id"], name: "index_user_histories_on_target_user_id_and_id", using: :btree

  create_table "user_open_ids", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.string   "email",      limit: 255, null: false
    t.string   "url",        limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                 null: false
  end

  add_index "user_open_ids", ["url"], name: "index_user_open_ids_on_url", using: :btree

  create_table "user_search_data", primary_key: "user_id", force: :cascade do |t|
    t.tsvector "search_data"
  end

  add_index "user_search_data", ["search_data"], name: "idx_search_user", using: :gin

  create_table "user_stats", primary_key: "user_id", force: :cascade do |t|
    t.boolean "has_custom_avatar", default: false, null: false
    t.integer "topics_entered",    default: 0,     null: false
    t.integer "time_read",         default: 0,     null: false
    t.integer "days_visited",      default: 0,     null: false
    t.integer "posts_read_count",  default: 0,     null: false
    t.integer "likes_given",       default: 0,     null: false
    t.integer "likes_received",    default: 0,     null: false
    t.integer "topic_reply_count", default: 0,     null: false
  end

  create_table "user_visits", force: :cascade do |t|
    t.integer "user_id",    null: false
    t.date    "visited_at", null: false
  end

  add_index "user_visits", ["user_id", "visited_at"], name: "index_user_visits_on_user_id_and_visited_at", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",                      limit: 20,                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                          limit: 255
    t.text     "bio_raw"
    t.integer  "seen_notification_id",                      default: 0,     null: false
    t.datetime "last_posted_at"
    t.string   "email",                         limit: 256,                 null: false
    t.string   "password_hash",                 limit: 64
    t.string   "salt",                          limit: 32
    t.boolean  "active"
    t.string   "username_lower",                limit: 20,                  null: false
    t.string   "auth_token",                    limit: 32
    t.datetime "last_seen_at"
    t.string   "website",                       limit: 255
    t.boolean  "admin",                                     default: false, null: false
    t.datetime "last_emailed_at"
    t.boolean  "email_digests",                                             null: false
    t.integer  "trust_level",                                               null: false
    t.text     "bio_cooked"
    t.boolean  "email_private_messages",                    default: true
    t.boolean  "email_direct",                              default: true,  null: false
    t.boolean  "approved",                                  default: false, null: false
    t.integer  "approved_by_id"
    t.datetime "approved_at"
    t.integer  "digest_after_days"
    t.datetime "previous_visit_at"
    t.datetime "suspended_at"
    t.datetime "suspended_till"
    t.date     "date_of_birth"
    t.integer  "auto_track_topics_after_msecs"
    t.integer  "views",                                     default: 0,     null: false
    t.integer  "flag_level",                                default: 0,     null: false
    t.inet     "ip_address"
    t.integer  "new_topic_duration_minutes"
    t.boolean  "external_links_in_new_tab",                                 null: false
    t.boolean  "enable_quoting",                            default: true,  null: false
    t.boolean  "moderator",                                 default: false
    t.boolean  "blocked",                                   default: false
    t.boolean  "dynamic_favicon",                           default: false, null: false
    t.string   "title",                         limit: 255
    t.boolean  "use_uploaded_avatar",                       default: false
    t.string   "uploaded_avatar_template",      limit: 255
    t.integer  "uploaded_avatar_id"
    t.boolean  "email_always",                              default: false, null: false
    t.boolean  "watch_new_topics",                          default: false, null: false
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last_posted_at"], name: "index_users_on_last_posted_at", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree
  add_index "users", ["username_lower"], name: "index_users_on_username_lower", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type", limit: 255
    t.integer  "user_id"
    t.string   "user_type",      limit: 255
    t.string   "user_name",      limit: 255
    t.text     "modifications"
    t.integer  "number"
    t.integer  "reverted_from"
    t.string   "tag",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "versions", ["created_at"], name: "index_versions_on_created_at", using: :btree
  add_index "versions", ["number"], name: "index_versions_on_number", using: :btree
  add_index "versions", ["tag"], name: "index_versions_on_tag", using: :btree
  add_index "versions", ["user_id", "user_type"], name: "index_versions_on_user_id_and_user_type", using: :btree
  add_index "versions", ["user_name"], name: "index_versions_on_user_name", using: :btree
  add_index "versions", ["versioned_id", "versioned_type"], name: "index_versions_on_versioned_id_and_versioned_type", using: :btree

  create_table "views", id: false, force: :cascade do |t|
    t.integer "parent_id",              null: false
    t.string  "parent_type", limit: 50, null: false
    t.date    "viewed_at",              null: false
    t.integer "user_id"
    t.inet    "ip_address",             null: false
  end

  add_index "views", ["parent_id", "parent_type"], name: "index_views_on_parent_id_and_parent_type", using: :btree
  add_index "views", ["user_id", "parent_type", "parent_id"], name: "index_views_on_user_id_and_parent_type_and_parent_id", using: :btree

end

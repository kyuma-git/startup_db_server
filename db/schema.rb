ActiveRecord::Schema.define(version: 2019_11_20_104015) do
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "country_id", null: false
    t.string "description"
    t.string "adress"
    t.string "this_url"
    t.string "company_url"
    t.bigint "city_id"
    t.bigint "stage_id"
    t.integer "acquired"
    t.integer "active"
    t.datetime "founded"
    t.string "twitter"
    t.string "facebook"
    t.string "instagram"
    t.string "linkedin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_companies_on_city_id"
    t.index ["country_id"], name: "index_companies_on_country_id"
    t.index ["stage_id"], name: "index_companies_on_stage_id"
  end

  create_table "company_tags", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_tags_on_company_id"
    t.index ["tag_id"], name: "index_company_tags_on_tag_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "markets", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name", null: false
    t.string "img"
    t.string "description"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_members_on_company_id"
  end

  create_table "stages", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "companies", "cities"
  add_foreign_key "companies", "countries"
  add_foreign_key "companies", "stages"
  add_foreign_key "company_tags", "companies"
  add_foreign_key "company_tags", "tags"
  add_foreign_key "members", "companies"
end

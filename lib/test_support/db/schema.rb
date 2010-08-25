require 'sniff/database'

Sniff::Database.define_schema do
  create_table "diet_records", :force => true do |t|
    t.string   "name"
    t.integer  "profile_id"
    t.integer  "diet_class_id"
    t.float    "proximity"
    t.float    "conventionality"
    t.integer  "size"
    t.float    "intensity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "red_meat_share"
    t.float    "poultry_share"
    t.float    "fish_share"
    t.float    "eggs_share"
    t.float    "nuts_share"
    t.float    "dairy_share"
    t.float    "cereals_and_grains_share"
    t.float    "fruit_share"
    t.float    "vegetables_share"
    t.float    "oils_and_sugars_share"
    t.date     "start_date"
    t.date     "end_date"
  end
end

FactoryBot.define do
  factory :user_order do
    postal_code { "123-4567" }
    phone_number { "09012345678" }
    prefectures_id { 14 }
    municipality { "横浜市緑区" }
    address { "青山1-1-1" }
    building_name { "柳ビル" }
    token {"tok_abcdefghijk00000000000000000"}
    user_id { 1 }
    item_id { 2 }
  end
end

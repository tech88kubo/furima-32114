FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"123abc"}
    password_confirmation {"123abc"}
    first_name            {"太郎"}
    last_name             {"田中"}
    first_kana            {"タロウ"}
    last_kana             {"タナカ"}
    birthday              {"2000-01-01"} #モデルのテストの際、Sequel Proでどのような形でデータが保存されているのかを確認する
  end
end
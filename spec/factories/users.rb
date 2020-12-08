FactoryBot.define do
  factory :user do
    nickname           {"test"}
    firsrt_name        {"太郎"}
    last_name          {"田中"}
    first_kana         {"タロウ"}
    last_kana          {"タナカ"}
    email              {"test@example"}
    encrypted_password {123abc}
  end
end
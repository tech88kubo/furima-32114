FactoryBot.define do
  factory :item do
    name                {"花"}
    explanation         {"きれいな花です。"}
    category_id         {2}
    condition_id        {2}
    shipping_charges_id {2}
    days_to_ship_id     {2}
    price               {1000}
    prefectures_id      {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end

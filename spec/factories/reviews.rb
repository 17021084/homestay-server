FactoryBot.define do
  factory :review do
    user_id { "" }
    place_id { "" }
    detail { "MyText" }
    rating { "" }
  end
end

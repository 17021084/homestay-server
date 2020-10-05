FactoryBot.define do
  factory :booking do
    user_id { "" }
    place_id { "" }
    check_in_date { "2020-10-05 23:40:43" }
    check_out_date { "2020-10-05 23:40:43" }
    total_price { 1.5 }
  end
end

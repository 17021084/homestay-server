FactoryBot.define do
  factory :place do
    host_id { "" }
    is_verified { false }
    location_id { "" }
    name { "MyString" }
    thumbnail { "MyString" }
    bed_number { 1 }
    max_guest { 1 }
    latitude { 1.5 }
    longitude { 1.5 }
    address { "MyString" }
    base_price { 1.5 }
    extra_fee { 1.5 }
    rating { 1.5 }
    is_archived { false }
  end
end

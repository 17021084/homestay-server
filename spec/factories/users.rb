FactoryBot.define do
  factory :user do
    google_id { "MyString" }
    full_name { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    phone_number { "MyString" }
    is_host { false }
    address { "MyString" }
  end
end

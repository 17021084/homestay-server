require 'open-uri'

ha_noi = City.create(name: "Ha Noi",
  sub_name: "HAN",
  latitude: 21.0277644,
  longitude: 105.8341598)

District.create(city: ha_noi,
  name: "Ba Dinh",
  latitude: 21.0337815,
  longitude: 105.8140539)

District.create(city: ha_noi,
  name: "Hoan Kiem",
  latitude: 21.027964,
  longitude: 105.8510132)

District.create(city: ha_noi,
  name: "Tay Ho",
  latitude: 21.0811211,
  longitude: 105.8180306)

District.create(city: ha_noi,
  name: "Long Bien",
  latitude: 21.0548635,
  longitude: 105.8884966)

District.create(city: ha_noi,
  name: "Cau Giay",
  latitude: 21.0362368,
  longitude: 105.7905825)

District.create(city: ha_noi,
  name: "Dong Da",
  latitude: 21.0180725,
  longitude: 105.8299495)

District.create(city: ha_noi,
  name: "Hai Ba Trung",
  latitude: 21.0090571,
  longitude: 105.8607507)

District.create(city: ha_noi,
  name: "Hoang Mai",
  latitude: 20.9836984,
  longitude: 105.8636257)

District.create(city: ha_noi,
  name: "Thanh Xuan",
  latitude: 20.9959819,
  longitude: 105.8097244)

District.create(city: ha_noi,
  name: "Nam Tu Liem",
  latitude: 21.0034608,
  longitude: 105.7703287)

District.create(city: ha_noi,
  name: "Bac Tu Liem",
  latitude: 21.0730201,
  longitude: 105.7703287)

da_nang = City.create(name: "Da Nang",
  sub_name: "DAN",
  latitude: 16.0544068,
  longitude: 108.2021667)

District.create(city: da_nang,
    name: "Lien Chieu",
    latitude: 16.0717704,
    longitude: 108.1503823)

District.create(city: da_nang,
    name: "Thanh Khe",
    latitude: 16.0641802,
    longitude: 108.1873407)

District.create(city: da_nang,
    name: "Hai Chau",
    latitude: 16.0472002,
    longitude: 108.2199588)

District.create(city: da_nang,
    name: "Son Tra",
    latitude: 16.1069981,
    longitude: 108.2521815)

District.create(city: da_nang,
    name: "Ngu Hanh Son",
    latitude: 15.9955056,
    longitude: 108.2588049)

District.create(city: da_nang,
    name: "Cam Le",
    latitude: 16.0153669,
    longitude: 108.1962362)

hcm = City.create(name: "Ho Chi Minh",
  sub_name: "HCM",
  latitude: 10.8230989,
  longitude: 106.6296638)

District.create(city: hcm,
  name: "1",
  latitude: 10.7756587,
  longitude: 106.7004238)

District.create(city: hcm,
  name: "2",
  latitude: 10.7872729,
  longitude: 106.7498105)

District.create(city: hcm,
  name: "3",
  latitude: 10.7843695,
  longitude: 106.6844089)

District.create(city: hcm,
  name: "4",
  latitude: 10.7578263,
  longitude: 106.7012968)

District.create(city: hcm,
  name: "5",
  latitude: 10.7540279,
  longitude: 106.6633746)

District.create(city: hcm,
  name: "6",
  latitude: 10.7480929,
  longitude: 106.6352362)

District.create(city: hcm,
  name: "7",
  latitude: 10.7340344,
  longitude: 106.7215787)

District.create(city: hcm,
  name: "8",
  latitude: 10.7240878,
  longitude: 106.6286259)

District.create(city: hcm,
  name: "9",
  latitude: 10.8428402,
  longitude: 106.8286851)

District.create(city: hcm,
  name: "10",
  latitude: 10.7745965,
  longitude: 106.6679542)

District.create(city: hcm,
  name: "11",
  latitude: 10.7629739,
  longitude: 106.650084)

District.create(city: hcm,
  name: "12",
  latitude: 10.8671531,
  longitude: 106.6413322)

District.create(city: hcm,
  name: "Binh Tan",
  latitude: 10.7652581,
  longitude: 106.6038535)

District.create(city: hcm,
  name: "Binh Thanh",
  latitude: 10.8105831,
  longitude: 106.7091422)

District.create(city: hcm,
  name: "Go Vap",
  latitude: 10.8386779,
  longitude: 106.6652904)

District.create(city: hcm,
  name: "Phu Nhuan",
  latitude: 10.7991944,
  longitude: 106.6802639)

District.create(city: hcm,
  name: "Tan Binh",
  latitude: 10.8014659,
  longitude: 106.6525974)

District.create(city: hcm,
  name: "Tan Phu",
  latitude: 10.7900517,
  longitude: 106.6281901)

District.create(city: hcm,
  name: "Thu Duc",
  latitude: 10.8494094,
  longitude: 106.7537055)

quang = User.create(full_name: "Nhat Quang",
  email: "quangdvn@gmail.com",
  password: "123456",
  phone_number: "0977860499",
  is_host: 1,
  city_id: 1)

HostInformation.create(user: quang, is_super: 1)

khoa = User.create(full_name: "Anh Khoa",
  email: "khoa@gmail.com",
  password: "123456",
  phone_number: "0977860498",
  is_host: 1,
  city_id: rand(1..3))

HostInformation.create(user: khoa, is_super: 1)

huy = User.create(full_name: "Quang Huy",
  email: "huy@gmail.com",
  password: "123456",
  phone_number: "0977860497",
  is_host: 1,
  city_id: rand(1..3))

HostInformation.create(user: huy, is_super: 1)

trung = User.create(full_name: "Quang Trung",
  email: "trung@gmail.com",
  password: "123456",
  phone_number: "0977860496",
  is_host: 1,
  city_id: rand(1..3))

HostInformation.create(user: trung, is_super: 1)

def generate_phone number
  if number < 10
    "00#{number}"
  elsif 10 <= number && number < 100
    "0#{number}"
  else
    "#{number}"
  end
end

46.times do |n|
  full_name = Faker::Name.name
  email = "test#{n + 1}@gmail.com"
  phone_number = "0977861" + generate_phone(n)
  is_host = rand(0..1)
  city_id = rand(1..3)

  new_user = User.create!(full_name: full_name,
  email: email,
  password: "123456",
  phone_number: phone_number,
  is_host: is_host,
  city_id: city_id)

  if new_user.is_host
    HostInformation.create!(user: new_user, is_super: rand(0..1))
  end
end

Amenity.create(service_type: "Basic",
  name: "Heating")

Amenity.create(service_type: "Basic",
  name: "Hangers")

Amenity.create(service_type: "Basic",
  name: "Washer")

Amenity.create(service_type: "Basic",
  name: "TV")

Amenity.create(service_type: "Basic",
  name: "Netflix")

Amenity.create(service_type: "Basic",
  name: "Private Bathroom")

Amenity.create(service_type: "Basic",
  name: "Private Living Room")

Amenity.create(service_type: "Basic",
  name: "Iron")

Amenity.create(service_type: "Basic",
  name: "Air conditioning")

Amenity.create(service_type: "Basic",
  name: "Free WiFi")

Amenity.create(service_type: "Basic",
  name: "A welcome gift on arrival")

Amenity.create(service_type: "Dining",
  name: "Kitchen")
Amenity.create(service_type: "Dining",
  name: "Dishes and Silverware")

Amenity.create(service_type: "Dining",
  name: "Cooking basics")

Amenity.create(service_type: "Dining",
  name: "Dish Washer")

Amenity.create(service_type: "Dining",
  name: "Stove")

Amenity.create(service_type: "Dining",
  name: "Fridge")

Amenity.create(service_type: "Bed and Bath",
  name: "Hot Water")

Amenity.create(service_type: "Bed and Bath",
  name: "Hair Dryer")

Amenity.create(service_type: "Bed and Bath",
name: "Shampoo")

Amenity.create(service_type: "Bed and Bath",
  name: "Bathtub")

Amenity.create(service_type: "Facilities",
name: "Private Entrance")

Amenity.create(service_type: "Facilities",
name: "Free parking")

Amenity.create(service_type: "Facilities",
  name: "Elevator")

Amenity.create(service_type: "Safety Features",
  name: "First Aid Kit")

Amenity.create(service_type: "Safety Features",
  name: "Smoke Alarm")

Amenity.create(service_type: "Safety Features",
  name: "Fire extinguisher")

Rule.create(name: "No smoking")

Rule.create(name: "No pets")

Rule.create(name: "No parties or events")

Rule.create(name: "Not suitable for infants and children")

total_host_id = []

User.where(is_host: true).each do |host|
  total_host_id << host.id
end

def get_city user_id
  User.find_by(id: user_id).city.id
end

def get_district city_id
  City.find_by(id: city_id).districts.sample.id
end

def get_district_latitude district_id
  District.find_by(id: district_id).latitude
end

def get_district_longitude district_id
  District.find_by(id: district_id).longitude
end

def get_rules ids
  Rule.search_by_id ids
end

def get_amenities ids
  Amenity.search_by_id ids
end

100.times do |n|
  host_id = total_host_id.sample

  cur_city = get_city host_id
  cur_district = get_district cur_city
  cur_latitude = get_district_latitude cur_district
  cur_longitude = get_district_longitude cur_district

  is_verified = rand(0..1)
  name = Faker::Company.name
  bedroom_number = rand(2..5)
  bathroom_number = rand(1..3)
  max_guests = rand(2..10)
  latitude = rand(1..2) == 1 ? cur_latitude + rand(0.01..0.03) : cur_latitude - rand(0.01..0.03)
  longitude = rand(1..2) == 1 ? cur_longitude + rand(0.01..0.03) : cur_longitude - rand(0.01..0.03)
  address = Faker::Address.street_address
  base_price = rand(18..40)
  extra_fee = rand(0..5)
  rating = rand(3.5..5.0).round(1)

  new_place = Place.create!(host_id: host_id,
    location_id: cur_district,
    is_verified: is_verified,
    name: name,
    bedroom_number: bedroom_number,
    bathroom_number: bathroom_number,
    max_guests: max_guests,
    latitude: latitude,
    longitude: longitude,
    address: address,
    base_price: base_price,
    extra_fee: extra_fee,
    rating: rating)

  place_rules = Rule.ids.sample(rand(1..Rule.count))
  place_amenities = Amenity.ids.sample(rand(15..Amenity.count))

  new_place.rules << get_rules(place_rules)
  new_place.amenities << get_amenities(place_amenities)

  downloaded_thumbnail = URI.open("http://s3.amazonaws.com/redqteam.com/tripfinder-images/hotel-#{rand(1..20)}_thumb.jpg")
  downloaded_photo_1 = URI.open("https://a0.muscache.com/im/pictures/0896f474-8530-49cd-8e97-e689bfd7699e.jpg")
  downloaded_photo_2 = URI.open("https://a0.muscache.com/im/pictures/796c2b51-8dbe-4134-b584-1c636111a782.jpg")

  new_place.thumbnail.attach(io: downloaded_thumbnail, filename: "thumbnail")
  new_place.homestay_photos.attach([
      {io: downloaded_photo_1, filename: "photo_1"},
      {io: downloaded_photo_2, filename: "photo_2"}
    ])
end

def get_host_id place_id
  Place.find_by(id: place_id).host_id
end

10.times do
  place_id = Place.ids.sample
  total_user_id = User.ids
  total_user_id.delete(get_host_id(place_id))
  user_id = total_user_id.sample
  check_in_date = rand(2.weeks).seconds.since(1.day.ago)
  check_out_date = check_in_date + rand(1..7).days
  total_price = 50

  Booking.create!(user_id: user_id,
    place_id: place_id,
    check_in_date: check_in_date,
    check_out_date: check_out_date,
    total_price: total_price)
end

def get_total_user_place_id
  total_user_place_id = []

  User.ids.each do |user_id|
    Place.ids.each do |place_id|
      total_user_place_id << {user_id: user_id, place_id: place_id}
    end
  end
  total_user_place_id
end

review_user_place_id = get_total_user_place_id

200.times do
  user_place_id = review_user_place_id.sample
  review_user_place_id.delete user_place_id

  user_id = user_place_id[:user_id]
  place_id = user_place_id[:place_id]
  detail = Faker::Lorem.sentence(word_count: 50)
  rating = rand(3..5)

  Review.create!(user_id: user_id,
    place_id: place_id,
    detail: detail,
    rating: rating)
end

bookmark_user_place_id = get_total_user_place_id

10.times do
  user_place_id = bookmark_user_place_id.sample
  bookmark_user_place_id.delete user_place_id

  user_id = user_place_id[:user_id]
  place_id = user_place_id[:place_id]

  Bookmark.create!(user_id: user_id,
    place_id: place_id)
end

##################### SUCCESS #####################

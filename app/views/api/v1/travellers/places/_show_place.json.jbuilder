json.id place.id
json.is_verified place.is_verified
json.name place.name
json.host_id place.host.id
json.host place.host_full_name
json.bedroom_number place.bedroom_number
json.bathroom_number place.bathroom_number
json.max_guests place.max_guests
json.latitude place.latitude
json.longitude place.longitude
json.address place.address
json.base_price place.base_price
json.extra_fee place.extra_fee
if place.reviews.count.positive?
  json.rating place.reviews.sum(:rating) * 1.0 / place.reviews.count
else
  json.rating 0.0
end
json.is_archived place.is_archived
json.location place.location_name
json.location_id place.location_id
json.city_id place.location.city_id

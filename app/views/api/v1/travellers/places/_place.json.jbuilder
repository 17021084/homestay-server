json.id place.id
json.is_verified place.is_verified
json.name place.name
json.bedroom_number place.bedroom_number
json.bathroom_number place.bathroom_number
json.max_guests place.max_guests
json.latitude place.latitude
json.longitude place.longitude
json.address place.address
json.base_price place.base_price
json.extra_fee place.extra_fee
json.rating place.rating
json.is_archived place.is_archived
json.location place.location_name
json.host place.host_full_name
json.thumbnail rails_blob_url(place.thumbnail) if place.thumbnail.attached?

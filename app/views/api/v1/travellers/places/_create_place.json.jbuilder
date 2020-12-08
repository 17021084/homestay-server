json.id place.id
json.is_verified place.is_verified
json.name place.name
json.address place.address
json.rating place.rating
json.location place.location_name
json.host place.host_full_name
json.thumbnail rails_blob_url(place.thumbnail) if place.thumbnail.attached?

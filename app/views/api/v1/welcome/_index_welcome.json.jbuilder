json.id place.id
json.is_verified place.is_verified
json.name place.name
json.host_id place.host.id
json.host place.host_full_name
json.max_guests place.max_guests
json.base_price place.base_price
json.rating place.rating
json.is_archived place.is_archived
json.thumbnail rails_blob_url(place.thumbnail) if place.thumbnail.attached?

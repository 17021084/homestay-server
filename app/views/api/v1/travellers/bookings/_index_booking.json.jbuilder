json.id booking.id
json.is_verified booking.is_verified
json.name booking.name
json.address booking.address
json.rating booking.rating
json.location booking.location_name
json.thumbnail rails_blob_url(booking.thumbnail) if booking.thumbnail.attached?

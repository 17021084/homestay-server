json.id booking.id
json.address booking.address
json.name booking.name
json.rating booking.rating
json.total_price booking.total_price
json.thumbnail rails_blob_url(booking.thumbnail) if booking.thumbnail.attached?

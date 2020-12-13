json.id booking.id
json.is_verified booking.is_verified
json.name booking.name
json.address booking.address
if place.reviews.count.positive?
  json.rating place.reviews.sum(:rating) * 1.0 / place.reviews.count
else
  json.rating 0.0
end
json.location booking.location_name
json.thumbnail rails_blob_url(booking.thumbnail) if booking.thumbnail.attached?

json.id place.id
json.is_verified place.is_verified
json.name place.name
json.address place.address
if place.reviews.count.positive?
  json.rating place.reviews.sum(:rating) * 1.0 / place.reviews.count
else
  json.rating 0.0
end
json.location place.location_name
json.host place.host_full_name
json.thumbnail rails_blob_url(place.thumbnail) if place.thumbnail.attached?

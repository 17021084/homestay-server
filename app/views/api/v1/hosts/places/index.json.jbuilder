json.success true
json.data do
  json.place_count @places.count
  json.places @places do |place|
    json.id place.id
    json.name place.name
    json.address place.address + ", " + place.location_name
    if place.reviews.count.positive?
      json.rating place.reviews.sum(:rating) * 1.0 / place.reviews.count
    else
      json.rating 0.0
    end
    json.base_price place.base_price
    json.reviews_count place.reviews.count
    json.thumbnail rails_blob_url(place.thumbnail) if place.thumbnail.attached?
  end
end

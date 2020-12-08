json.success true
json.data do
  json.place_count @places.count
  json.places @places do |place|
    json.id place.id
    json.name place.name
    json.address place.address + ", " + place.location_name
    json.rating place.rating
    json.thumbnail rails_blob_url(place.thumbnail) if place.thumbnail.attached?
  end
end

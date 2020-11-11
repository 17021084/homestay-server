json.success true
json.data do
  json.count @places_count
  json.places @places_data do |place|
    json.partial! "index_place", place: place
  end
end

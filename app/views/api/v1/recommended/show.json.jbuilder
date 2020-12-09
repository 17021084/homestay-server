json.success true
json.data do
  json.count @places.length
  json.places @places do |place|
    json.partial! "place", place: place
  end
end

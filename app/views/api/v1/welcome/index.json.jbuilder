json.success true
json.data do
  json.places_in_city @number_places_in_city
  json.best_places @best_places do |place|
    json.partial! "index_welcome", place: place
  end
end

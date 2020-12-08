json.success true
json.data do
  json.rule_count @rules.count
  json.rules @rules do |rule|
    json.id rule.id
    json.name rule.name
  end
  json.amenity_count @amenities.count
  json.amenities @amenities do |amenity|
    json.id amenity.id
    json.name amenity.name
  end
end

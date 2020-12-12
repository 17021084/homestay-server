json.success true
json.data do
  json.partial! "show_place", place: @place
  if @place.homestay_photos.attached?
    json.photos @place.homestay_photos do |photo|
      json.url rails_blob_url photo
    end
  end
  json.bookings @place.bookings do |booking|
    json.partial! "booking", booking: booking
  end
  json.booking_count @place.bookings.count
  json.reviews @place.reviews do |review|
    json.partial! "review", review: review
  end
  json.review_count @place.reviews.count
  json.rules @place.rules do |rule|
    json.id rule.id
    json.name rule.name
  end
  json.rule_count @place.rules.count
  json.amenities @place.amenities do |amenity|
    json.id amenity.id
    json.service_type amenity.service_type
    json.name amenity.name
  end
  json.amenity_count @place.amenities.count
end

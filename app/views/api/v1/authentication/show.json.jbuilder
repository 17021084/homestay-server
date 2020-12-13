json.success true
json.data do
  json.id @current_user.id
  json.full_name @current_user.full_name
  json.email @current_user.email
  json.phone_number @current_user.phone_number
  json.is_host @current_user.is_host
  json.city_id @current_user.city_id
  json.bookmark_count @current_user.bookmarks.count
  json.bookmarks @current_user.bookmarks.pluck :place_id
  json.booking_places_count @current_user.bookings.pluck(:place_id).uniq.length
  json.booking_places @current_user.bookings.pluck(:place_id).uniq
  if @current_user.is_host
    json.is_super @current_user.is_super
    json.hosted_count @current_user.places.count
    json.hosted @current_user.places.pluck :id
  end
end

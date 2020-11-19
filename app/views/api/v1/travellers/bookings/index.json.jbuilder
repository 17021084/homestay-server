json.success true
json.data do
  json.count @bookings_history.length
  json.bookings @bookings_history do |booking|
    json.partial! "index_booking", booking: booking
  end
end

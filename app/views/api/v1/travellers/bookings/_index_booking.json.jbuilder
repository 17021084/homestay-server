json.id booking.id
json.address booking.address
json.name booking.name
json.rating booking.rating
json.check_in_date  booking.check_in_date
json.check_out_date booking.check_out_date
json.total_price booking.total_price
json.thumbnail rails_blob_url(booking.thumbnail) if booking.thumbnail.attached?

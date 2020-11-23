json.success true
json.booking @booking_response[:booking].attributes.except "created_at", "updated_at"

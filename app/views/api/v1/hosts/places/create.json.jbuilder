json.success true
json.data do
  json.id @place_detail.id
  json.host_id @place_detail.host_id
  json.host_name User.find_by(id: @place_detail.host_id).try(:full_name)
  json.location District.find_by(id: @place_detail.location_id).try(:name)
  json.is_verified @place_detail.is_verified
  json.place_name @place_detail.name
  json.place_address @place_detail.address
  json.latitude @place_detail.latitude
  json.longitude @place_detail.longitude
  json.bedroom_number @place_detail.bedroom_number
  json.bathroom_number @place_detail.bathroom_number
  json.max_guests @place_detail.max_guests
  json.base_price @place_detail.base_price
  json.extra_fee @place_detail.extra_fee
  json.thumbnail rails_blob_url(@place_detail.thumbnail) if @place_detail.thumbnail.attached?
  if @place_detail.homestay_photos.attached?
    json.photos @place_detail.homestay_photos do |photo|
      # json.array! rails_blob_url photo
      json.filename photo.filename
      json.url rails_blob_url photo
    end
  end
end

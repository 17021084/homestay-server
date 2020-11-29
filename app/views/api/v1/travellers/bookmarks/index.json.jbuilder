json.success true
json.data do
  json.user_name @user_name
  json.count @bookmark_places.length
  json.bookmarks @bookmark_places do |place|
    json.partial! "index_bookmark", place: place
  end
end

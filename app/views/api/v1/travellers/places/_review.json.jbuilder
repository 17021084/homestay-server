json.id review.id
json.user_id review.user_id
json.user_name User.find_by(id: review.user_id).full_name
json.detail review.detail
json.rating review.rating
json.created_at review.created_at

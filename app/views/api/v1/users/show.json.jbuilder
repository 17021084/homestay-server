json.success true
json.user @user.attributes.except "created_at", "updated_at", "password_digest", "google_id", "id", "is_host"

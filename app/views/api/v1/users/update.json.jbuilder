json.success true
json.user @user.attributes.except "created_at", "updated_at", "password_digest", "activation_digest", "activated_at"
json.message "Updated"

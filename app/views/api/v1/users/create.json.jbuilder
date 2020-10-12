json.success true
json.user @user.attributes.except "created_at", "updated_at", "password_digest"
json.token @token

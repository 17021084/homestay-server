json.success true
json.user @user.attributes.except "created_at", "updated_at", "password_digest", "activation_digest", "activated_at",
                                  "reset_digest", "reset_sent_at"
json.message "Account inst activated"
json.token @token

module AuthenticationsHelper
  def encode_token payload
    JWT.encode(payload, ENV["JWT_SECRET"], ENV["HASH_ALGORITHM"])
  end

  def auth_header
    request.headers["Authorization"]
  end

  def decoded_token
    return unless auth_header

    begin
      JWT.decode(auth_header, ENV["JWT_SECRET"], ENV["HASH_ALGORITHM"])
    rescue JWT::DecodeError
      nil
    end
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token[0]["user_id"]
    @user = User.find user_id
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    return if logged_in?

    render json: {
      success: false,
      message: "you are unauthorized!"
    }, status: :unauthorized
  end
end

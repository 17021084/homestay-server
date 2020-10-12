class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base

  class << self
    def encode payload
      JWT.encode payload, SECRET_KEY
    end

    def decode token
      decoded = JWT.decode(token, SECRET_KEY).first
      HashWithIndifferentAccess.new decoded
    end
  end
end

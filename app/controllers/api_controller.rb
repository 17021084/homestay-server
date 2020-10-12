class ApiController < ApplicationController
  before_action :set_default_format

  attr_reader :current_user

  def authenticate_token!
    payload = JsonWebToken.decode auth_token
    return if payload.blank?

    @current_user = User.find_by id: payload["id"]

    @current_user.nil? &&
      render(json: {success: false, message: "Unavailable User"}, status: :not_found)
  rescue JWT::DecodeError
    render json: {success: false, message: "Invalid Token"}, status: :unauthorized
  end

  def auth_token
    @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
  end

  def set_default_format
    request.format = :json
  end
end

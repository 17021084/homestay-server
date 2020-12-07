class Api::V1::Hosts::SwitchingController < ApiController
  before_action :authenticate_token!, only: [:edit]
  before_action :is_host?, only: [:edit]

  def edit
    @current_user.switch_to_host
    refresh_token = JsonWebToken.encode id: @current_user.id, is_host: @current_user.is_host
    render json: {
      success: true,
      data: @current_user.attributes.except("created_at", "updated_at", "password_digest", "activation_digest",
                                            "activated_at", "reset_digest", "reset_sent_at"),
      token: refresh_token
    }
  end

  private

  def is_host?
    return unless @current_user.is_host

    render json: {success: false, message: "You are already a host"}, status: :forbidden
  end
end

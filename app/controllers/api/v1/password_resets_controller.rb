class Api::V1::PasswordResetsController < ApplicationController
  before_action :get_user, only: [:update]
  before_action :valid_user, only: [:update]
  before_action :check_expiration, only: [:update]

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.reset_password
      render json: {
        success: true,
        message: "Reset password token was sent to your email"
      }, status: :ok
    else
      render json: {
        success: false,
        message: "Email address not found"
      }, status: :bad_request
    end
  end

  def edit
    # request.headers["resent_token"] = @user.resent_token
    redirect_to "https://www.google.com.vn/"
  end

  def update
    if @user.update(user_params)
      render json: {
        success: true,
        message: "Update success"
      }, status: :ok
    else
      render json: {
        success: false,
        error: @user.errors
      }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit User::USER_RESET_PARAMS
  end

  # default 2 hours ago
  def check_expiration
    return unless @user.password_reset_expired?

    render json: {
      success: false,
      message: "Reset password token has expired."
    }, status: :bad_request
  end

  def get_user
    @user = User.find_by(email: params[:email])
    return render json: {success: false, message: "Email not found"}, status: :not_found if @user.nil?
  end

  def valid_user
    case @user.check_valid :reset, params[:reset_token]
    when "unactivated"
      render json: {success: false, message: "Account wasnt activated"}, status: :bad_request
    when "invalid_reset"
      render json: {success: false, message: "Invalid reset password token"}, status: :bad_request
    end
  end
end

class Api::V1::UsersController < ApplicationController
  before_action :authorized, only: [:load_user, :show]
  before_action :load_user, only: [:show]

  def show
    render :show, status: :ok
  end

  def create
    @user = User.create user_signup_params
    if @user.valid?
      @token = encode_token({user_id: @user.id})
      render :create, status: :ok
    else
      render json: {
        success: false,
        message: @user.errors.full_messages
      }, status: :bad_request
    end
  end

  def login
    @user = User.find_by email: params[:email]
    if @user&.authenticate params[:password]
      token = encode_token({user_id: @user.id})
      render json: {
        success: true,
        message: "Logged in",
        token: token
      }, status: :ok
    else
      render json: {
        success: false,
        message: "Email or Password is invalid"
      }, status: :bad_request
    end
  end

  private

  def user_signup_params
    params.permit :email, :password, :phone_number, :full_name, :city_id, :password_confirmation
  end

  def load_user
    @user = User.find params[:id]
  rescue StandardError => e
    render json: {
      success: false,
      message: e
    }, status: :not_found
  end
end

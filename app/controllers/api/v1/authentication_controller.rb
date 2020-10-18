class Api::V1::AuthenticationController < ApiController
  before_action :authenticate_token!, only: :show

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate params[:password]&.activated?
      valid_token = JsonWebToken.encode id: user.id, is_host: user.is_host
      render json: {success: true, token: valid_token}, status: :ok

    elsif user.nil?
      render json: {success: false, message: "Account not found"}, status: :not_found
    else
      render json: {success: false, message: "Incorrect password Or Account wasnt activated"}, status: :bad_request
    end
  end

  def google
    # user = User.from_omniauth(request.env["omniauth.auth"])
    auth = request.env["omniauth.auth"]
    # debugger
    # render json: params[:provider]
    render json: auth
  end

  def show
    render :show
  end
end

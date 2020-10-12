class Api::V1::AuthenticationController < ApiController
  before_action :authenticate_token!, only: :show

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate params[:password]
      valid_token = JsonWebToken.encode id: user.id, is_host: user.is_host
      render json: {success: true, token: valid_token}, status: :ok
    elsif user.nil?
      render json: {success: false, message: "Account not found"}, status: :not_found
    else
      render json: {success: false, message: "Incorrect password"}, status: :bad_request
    end
  end

  def show
    render :show
  end
end

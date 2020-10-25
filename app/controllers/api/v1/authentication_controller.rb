class Api::V1::AuthenticationController < ApiController
  before_action :authenticate_token!, only: :show

  def create
    user = User.find_by email: params[:email]
    return render json: {success: false, message: "Account not found"}, status: :not_found if user.nil?

    case user.login_check params[:password]
    when :success
      valid_token = JsonWebToken.encode id: user.id, is_host: user.is_host
      render json: {success: true, token: valid_token}, status: :ok
    when :invalid_password
      render json: {success: false, message: "Incorrect password "}, status: :bad_request
    when :unactivated
      render json: {success: false, message: "Account wasnt activated"}, status: :bad_request
    else
      render json: {success: false, message: "login fail"}, status: :bad_request
    end
  end

  def show
    render :show
  end
end

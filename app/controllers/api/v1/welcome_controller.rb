class Api::V1::WelcomeController < ApiController
  def index
    render json: {success: true, message: "Hello to Homestay API"},
    status: :ok
  end
end

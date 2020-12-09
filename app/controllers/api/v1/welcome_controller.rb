class Api::V1::WelcomeController < ApiController
  def index
    render json: {success: true, messages: "Welcome to Homestay API"}
  end
end

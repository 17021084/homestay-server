class Api::V1::WelcomeController < ApiController
  def index
    @number_places_in_city = Place.joins(:location).group(:city_id).count
    @best_places = Place.order(rating: :desc).first(30)

    render :index, status: :ok
  end
end

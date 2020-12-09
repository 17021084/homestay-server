class Api::V1::LocationController < ApiController
  def index
    @place_number_by_city = Place.get_place_number_by_city
    render json: {success: true, data: @place_number_by_city}, status: :ok
  end

  def show
    @places = Place.with_attach_thumbnail
                   .includes(:location, :host)
                   .get_places_by_city(params[:id])
                   .order(rating: :desc)

    render :show, status: :ok
  end
end

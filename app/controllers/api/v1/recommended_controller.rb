class Api::V1::RecommendedController < ApiController
  def index
    @place_number_by_city = Place.get_place_number_by_city
    render json: {success: true, data: @place_number_by_city}, status: :ok
  end

  def show
    if params[:id] == "5" || params[:id] == "25"
      @places = Place.with_attach_thumbnail
                     .includes(:location, :host)
                     .order(rating: :desc)
                     .first(params[:id].to_i)

      render :show, status: :ok
    else
      render json: {success: false, messages: "Invalid place number"}
    end
  end
end

class Api::V1::LocationController < ApiController
  def show
    cur_district = District.find_by id: params[:id]

    render json: {success: true,
                  data: {
                    name: cur_district.name,
                    longitude: cur_district.longitude,
                    latitude: cur_district.latitude
                  }},
    status: :ok
  rescue NoMethodError
    render json: {success: false, message: "Invalid location"}
  end
end

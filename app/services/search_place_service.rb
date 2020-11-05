class SearchPlaceService < ApplicationService
  def initialize params
    @city_id = params[:city_id]
    @district_id = params[:district_id]
    @check_in_date = params[:check_in_date]
    @check_out_date = params[:check_out_date]
    @guests = params[:guests]
    @page = params[:page]
    @per = params[:per]
  end

  def perform
    return {success: false, message: "Invalid date"} unless is_date_valid?

    return {success: false, message: "Invalid location"} unless is_location_valid? @city_id, @district_id

    places = Place.order_by_rating
                  .location(@district_id)
                  .max_guests(@guests)
                  .available_room(@check_in_date, @check_out_date)
                  .group("places.id")

    {success: true, count: places.length, data: places}
  end

  private

  def is_date_valid?
    false if @check_in_date.in_time_zone.past?

    @check_in_date.in_time_zone < @check_out_date.in_time_zone
  end

  def is_location_valid? city_id, district_id
    cur_city_id = City.find_by(id: city_id).try(:id)
    cur_district_id = District.find_by(id: district_id).try(:city_id)

    return true if cur_city_id == cur_district_id
  end
end

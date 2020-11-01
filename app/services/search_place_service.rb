class SearchPlaceService < ApplicationService
  def initialize params
    @city_id = params[:city_id]
    @district_id = params[:district_id]
    @check_in_date = format_date params[:check_in_date]
    @check_out_date = format_date params[:check_out_date]
    @max_guests = params[:max_guests]
    @page = params[:page]
    @per = params[:per]
  end

  def perform
    return {success: false, message: "invalid check in past"} if @check_in_date.to_datetime.past?

    return {success: false, message: "check in date before check out date"} unless check_check_out_date?

    places = Place.select("Places.*, cities.name as city_name, districts.name as district_name ")
                  .left_outer_joins(:bookings)
                  .joins(location: :city)
                  .where(free_places_condition, check_in: @check_in_date, check_out: @check_out_date)
                  .where(cities: {id: @city_id})
                  .where(districts: {id: @district_id})
                  .where("max_guests >= ?", @max_guests)
                  .group("places.id")
    {success: true, data: places.page(@page).per(@per)}
  end
  private
  def free_places_condition
    "bookings.check_in_date is NULL OR bookings.check_out_date<:check_in OR :check_out < bookings.check_in_date"
  end

  def check_check_out_date?
    @check_in_date.to_datetime <= @check_out_date.to_datetime
  end
end

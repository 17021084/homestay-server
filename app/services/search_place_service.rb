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

    load_places
    search_places
    {success: true, count: @places.length, data: @places}
  end

  private
  def load_places
    @places = Place.select_place
                   .order_by_rating
                   .location(@district_id)
                   .max_guests(@guests)
                   .to_a
  end

  def search_places
    flag = []
    @places.each do |place|
      next if place.check_in_date.nil? ||
              (place.check_out_date.in_time_zone < @check_in_date.in_time_zone) ||
              (@check_out_date.in_time_zone < place.check_in_date.in_time_zone)

      flag.push place.id
    end
    @places.uniq!{|p| p[:id]}
    flag.each do |f|
      @places.delete_if{|place| place[:id] == f}
    end
  end

  def is_date_valid?
    return false if @check_in_date.in_time_zone.past?

    @check_in_date.in_time_zone < @check_out_date.in_time_zone
  end

  def is_location_valid? city_id, district_id
    cur_city_id = City.find_by(id: city_id).try(:id)
    cur_district_id = District.find_by(id: district_id).try(:city_id)

    return true if cur_city_id == cur_district_id
  end
end

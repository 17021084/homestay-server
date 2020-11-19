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

    all_places = get_places @district_id, @guests
    available_places = get_available_places all_places, @check_in_date, @check_out_date

    {success: true, count: available_places.length, data: available_places}
  end

  private

  def get_places district_id, guests
    Place.order_by_rating
         .get_all_places
         .location(district_id)
         .max_guests(guests)
         .to_a
  end

  def get_available_places all_places, check_in_date, check_out_date
    reserved_places = []

    all_places.each do |place|
      next if is_valiable_place? place, check_in_date, check_out_date

      reserved_places.push place.id
    end
    all_places.uniq!{|p| p[:id]}

    reserved_places.each do |reserved_id|
      all_places.delete_if{|place| place[:id] == reserved_id}
    end
    all_places
  end

  def is_location_valid? city_id, district_id
    cur_city_id = City.find_by(id: city_id).try(:id)
    cur_district_id = District.find_by(id: district_id).try(:city_id)

    return true if cur_city_id == cur_district_id
  end
end

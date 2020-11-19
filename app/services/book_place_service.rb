class BookPlaceService < ApplicationService
  def initialize params, user_id
    @place_id = params[:place_id]
    @user_id = user_id
    @check_in_date = params[:check_in_date]
    @check_out_date = params[:check_out_date]
    @guests = params[:guests]
    @params = params
  end

  def perform
    return {success: false, message: "Invalid date"} unless is_date_valid?

    place = check_available @place_id, @check_in_date, @check_out_date
    case place
    when :invalid_place
      {success: false, message: "Invalid place"}
    when :cant_book
      {success: false, message: "Place has been booked"}
    when :guests_over
      {success: false, message: "Invalid guests "}
    else

      @params[:total_price] = get_total_price @check_in_date, @check_out_date, place
      @params[:user_id] = @user_id

      booking = Booking.create @params
      if booking.save
        {success: true, booking: booking, place: place}
      else
        {success: false, message: booking.errors.full_messages}
      end
    end
  end

  private

  def check_available place_id, check_in_date, check_out_date
    checked_times = Place.get_all_places.get_bookings_by_place(place_id)
    return :invalid_place if checked_times.empty?

    checked_times.each do |place|
      next if is_valiable_place? place, check_in_date, check_out_date

      return :cant_book
    end

    return :guests_over if @guests.nil? || checked_times[0].max_guests < @guests

    checked_times[0]
  end

  def get_total_price check_in_date, check_out_date, place
    nights = (check_out_date.to_date - check_in_date.to_date).to_i
    place.base_price * nights + place.extra_fee
  end
end

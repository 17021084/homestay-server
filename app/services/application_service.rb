class ApplicationService
  def format_date date_time
    date_time.to_time_zone.strftime "%Y-%m-%d %H:%M:%S"
  rescue ArgumentError
    nil
  end

  def is_place_available? place, check_in_date, check_out_date
    place.check_in_date.nil? ||
      (place.check_out_date.in_time_zone < check_in_date.in_time_zone) ||
      (check_out_date.in_time_zone < place.check_in_date.in_time_zone)
  end

  def is_date_valid?
    return false if @check_in_date.in_time_zone < Time.zone.now.midnight

    @check_in_date.in_time_zone < @check_out_date.in_time_zone
  rescue ArgumentError, NoMethodError
    nil
  end
end

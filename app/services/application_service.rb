class ApplicationService
  def format_date date_time
    date_time.in_time_zone
  rescue ArgumentError
    nil
  end
end

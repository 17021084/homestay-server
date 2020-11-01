class ApplicationService
  def format_date date_time
    date_time.to_datetime.strftime "%Y-%m-%d %H:%M:%S"
  end
end

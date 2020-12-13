class BookingMailer < ApplicationMailer
  def notify_user user, place, booking
      @user = user
      @place = place
      @booking = booking
      @url = ENV['CLIENT_URL']+"places/#{@booking.place_id}/details"
      mail to: user.email, subject: "HomeStay Booking Success"
  end
  def notify_host user, place, booking
      @user = user
      @place = place
      @booking = booking
      @url = ENV['CLIENT_URL']+"places/#{@booking.place_id}/details"
      mail to: @place.host.email, subject: "HomeStay Booking Notification"
  end
end

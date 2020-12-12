class BookingMailer < ApplicationMailer
  def booking_place user, place, booking
      @user = user
      @place = place
      @booking = booking
      @url = ENV['CLIENT_URL']+"places/#{@booking.place_id}/details"
      mail to: user.email, subject: "HomeStay Booking Success"
  end
end

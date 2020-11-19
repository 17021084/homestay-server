class Api::V1::Travellers::BookingsController < ApiController
  before_action :authenticate_token!, only: :create
  def create
    @booking_response = BookPlaceService.new(booking_params, @current_user.id).perform

    if @booking_response[:success]
      BookingMailer.booking_place(@current_user, @booking_response[:place], @booking_response[:booking]).deliver_now
      render :create, status: :ok
    else
      render json: {success: @booking_response[:success], message: @booking_response[:message]}, status: :bad_request
    end
  end

  private
  def booking_params
    params.permit Booking::BOOKING_PARAMS
  end
end

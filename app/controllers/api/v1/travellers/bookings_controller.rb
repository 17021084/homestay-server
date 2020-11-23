class Api::V1::Travellers::BookingsController < ApiController
  before_action :authenticate_token!, only: [:create, :index]
  def create
    @booking_response = BookPlaceService.new(booking_params, @current_user.id).perform

    if @booking_response[:success]
      BookingMailer.booking_place(@current_user, @booking_response[:place], @booking_response[:booking])
                   .deliver_later(wait: Settings.delay_mail.bookings.seconds)
      render :create, status: :ok
    else
      render json: {success: @booking_response[:success], message: @booking_response[:message]}, status: :bad_request
    end
  end

  def index
    @bookings_history = Place.get_all_bookings_history.get_by_user_id(@current_user.id).order_by_check_in_date
    render :index, status: :ok
  end

  private
  def booking_params
    params.permit Booking::BOOKING_PARAMS
  end
end

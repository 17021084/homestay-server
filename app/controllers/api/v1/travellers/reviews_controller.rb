class Api::V1::Travellers::ReviewsController < ApiController
  before_action :authenticate_token!, only: [:create, :update, :destroy]
  before_action :load_review, only: [:update, :destroy]
  before_action :reviewable?, only: [:create]

  def create
    review = Review.create review_create_params
    if review.save
      render json: {success: true, data: review}, status: :ok
    else
      render json: {
        success: false,
        message: review.errors.full_messages
      }, status: :bad_request
    end
  rescue ActiveRecord::RecordNotUnique
    render json: {
      success: false,
      message: "One user review just one place"
    }, status: :bad_request
  end

  def destroy
    @review.destroy
    render json: {
      success: true,
      message: "Delete review"
    }, status: :ok
  end

  def update
    if @review.update review_update_params
      render json: {
        success: true,
        data: @review
      }, status: :ok
    else
      render json: {
        success: false,
        message: @review.errors.full_messages
      }, status: :bad_request
    end
  end

  private

  def review_create_params
    create_params = params.permit Review::REVIEW_CREATE_PARAMS
    create_params[:user_id] = @current_user.id
    create_params
  end

  def review_update_params
    params.permit Review::REVIEW_UPDATE_PARAMS
  end

  def load_review
    @review = Review.find_by id: params[:id]
    if @review.nil?
      render json: {
        success: false,
        message: "Not found"
      }, status: :not_found
    elsif @review.user_id != @current_user.id
      render json: {
        success: false,
        message: "Cant access another's review"
      }, status: :unauthorized
    end
  end

  def reviewable?
    booking = Booking.has_booked(@current_user.id, params[:place_id])
    return unless booking.empty?

    render json: {
      success: false,
      message: "You havent experienced completely!"
    }, status: :bad_request
  end
end

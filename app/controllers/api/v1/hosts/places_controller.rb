class Api::V1::Hosts::PlacesController < ApiController
  before_action :authenticate_token!, only: [:index, :create]
  before_action :is_host?, only: [:index, :create]

  def index
    @places = @current_user.places.with_attach_thumbnail
    render :index
  end

  def create
    @create_response = CreatePlaceService.new(create_place_params, @current_user.id).perform
    if @create_response[:success]
      @place_detail = @create_response[:place]
      render :create
    else
      render json: {success: false, messages: @create_response[:messages]}
    end
  end

  private

  def create_place_params
    params.permit Place::CREATE_PARAMS
  end

  def is_host?
    return if @current_user.is_host

    render json: {success: false, message: "You are not a host"}, status: :forbidden
  end
end

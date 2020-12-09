class Api::V1::Travellers::PlacesController < ApplicationController
  before_action :find_place, only: :show

  def create
    @places_response = SearchPlaceService.new(searching_params).perform
    if @places_response[:success]
      @places_data = @places_response[:data]
      @places_count = @places_response[:count]

      render :create, status: :ok
    else
      render json: {success: @places_response[:success], message: @places_response[:message]}, status: :bad_request
    end
  end

  def show
    render :show, status: :ok
  end

  private

  def find_place
    @place = Place.with_attach_thumbnail
                  .find_by id: params[:id]
    return if @place

    render json: {success: false, message: "Place not found"}, status: :not_found
  end

  def searching_params
    params.permit Place::SEARCHING_PARAMS
  end
end

class Api::V1::Travellers::PlacesController < ApplicationController
  def index
    @places_response = SearchPlaceService.new(searching_params).perform
    if @places_response[:success]
      @places_data = @places_response[:data]
      @places_count = @places_response[:count]

      render :index, status: :ok
    else
      render json: {success: @places_response[:success], message: @places_response[:message]}, status: :bad_request
    end
  end

  private

  def searching_params
    params.permit Place::SEARCHING_PARAMS
  end
end

class Api::V1::PlacesController < ApplicationController
  def search
    render json: SearchPlaceService.new(params).perform, status: :ok
  end
end

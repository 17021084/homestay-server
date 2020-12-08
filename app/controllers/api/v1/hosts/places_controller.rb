class Api::V1::Hosts::PlacesController < ApiController
  before_action :authenticate_token!, only: [:index, :create]
  before_action :is_host?, only: [:index, :create]

  def index
    @places = @current_user.places
    render :index
  end

  def create
    render json: {success: true}
  end

  private

  # def find_place
  #   @place = Place.find_by id: params[:id]
  #   return if @place

  #   render json: {success: false, message: "Place not found"}, status: :not_found
  # end

  def is_host?
    return if @current_user.is_host

    render json: {success: false, message: "You are not a host"}, status: :forbidden
  end
end

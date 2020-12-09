class Api::V1::Hosts::ExtraInfoController < ApiController
  before_action :authenticate_token!, only: [:index]
  before_action :is_host?, only: [:index]

  def index
    @rules = Rule.all
    @amenities = Amenity.all
    render :index, status: :ok
  end

  private

  def is_host?
    return if @current_user.is_host

    render json: {success: false, message: "You are not a host"}, status: :forbidden
  end
end

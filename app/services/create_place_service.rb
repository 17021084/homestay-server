class CreatePlaceService < ApplicationService
  def initialize params, host_id
    @host_id = host_id
    @rules = params[:rules]
    @amenities = params[:amenities]
    @params = params
  end

  def perform
    place_params = create_params(@host_id, @params, :amenities, :rules)
    place = Place.create place_params
    if place.save
      place_rules = get_rules @rules
      place_amenities = get_amenities @amenities
      place.rules << place_rules
      place.amenities << place_amenities
      {success: true, place: place}
    else
      {success: false, messages: place.errors.full_messages}
    end
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    {success: false, messages: "Invalid file"}
  end

  private

  def create_params host_id, input_params, *except_params
    is_verified = is_super_host? host_id
    except_params.each do |param|
      input_params.extract!(param)
    end
    input_params.merge({is_verified: is_verified, host_id: host_id, rating: 0})
  end

  def get_rules ids
    Rule.search_by_id ids
  end

  def get_amenities ids
    Amenity.search_by_id ids
  end

  def is_super_host? host_id
    User.find_by(id: host_id).try(:is_super)
  end
end

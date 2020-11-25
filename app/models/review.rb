class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place
  REVIEW_CREATE_PARAMS = %i(place_id detail rating).freeze
  REVIEW_UPDATE_PARAMS = %i(detail rating).freeze
  validates :rating, presence: true, inclusion: {in: 0..5}
end

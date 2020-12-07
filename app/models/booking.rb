class Booking < ApplicationRecord
  BOOKING_PARAMS = [:place_id, :check_in_date, :check_out_date, :guests].freeze

  belongs_to :user
  belongs_to :place

  validates :place_id, presence: true
  validates :user_id, presence: true
  validates :total_price, presence: true
  validates :guests, presence: true
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true

  scope :has_booked, ->(user_id, place_id){where(Settings.query.can_review, user_id, place_id, Time.zone.now).limit(1)}
end

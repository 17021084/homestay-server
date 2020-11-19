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
end

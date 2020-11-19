class Place < ApplicationRecord
  SEARCHING_PARAMS = [:city_id, :district_id, :check_in_date, :check_out_date, :guests].freeze

  has_one_attached :thumbnail
  has_many_attached :homestay_photos
  has_and_belongs_to_many :amenities
  has_and_belongs_to_many :rules
  has_many :bookings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :host, class_name: User.name, foreign_key: :host_id
  belongs_to :location, class_name: District.name, foreign_key: :location_id

  delegate :name, to: :location, prefix: true
  delegate :full_name, to: :host, prefix: true

  scope :order_by_rating, ->{left_joins(:bookings).order rating: :desc}
  scope :location, ->(district_id){where location_id: district_id}
  scope :max_guests, ->(guests){where(Settings.query.max_guests, guests)}
  scope :get_all_places, ->{select(Settings.query.all_places)}
  scope :get_bookings_by_place, ->(place_id){left_joins(:bookings).where(Settings.query.place_id, place_id)}
end

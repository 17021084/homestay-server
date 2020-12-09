class Place < ApplicationRecord
  SEARCHING_PARAMS = [:city_id, :district_id, :check_in_date, :check_out_date, :guests].freeze
  CREATE_PARAMS = [:location_id, :name, :bedroom_number, :bathroom_number,
                   :max_guests, :latitude, :longitude, :address, :base_price,
                   :extra_fee, :thumbnail, homestay_photos: [], rules: [], amenities: []].freeze

  has_one_attached :thumbnail
  has_many_attached :homestay_photos
  has_and_belongs_to_many :amenities
  has_and_belongs_to_many :rules
  has_many :bookings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :host, class_name: User.name, foreign_key: :host_id
  belongs_to :location, class_name: District.name, foreign_key: :location_id

  validates :host_id, presence: true
  validates :location_id, presence: true
  validates :name, presence: true,
                   length: {minimum: Settings.validations.place.name_minlength,
                            maximum: Settings.validations.place.name_maxlength}
  validates :bedroom_number, presence: true,
                             numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 10}
  validates :bathroom_number, presence: true,
                              numericality: {only_integer: true, greater_than: 0, greater_than_or_equal_to: 5}
  validates :max_guests, presence: true, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 20}
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
  validates :address, presence: true
  validates :base_price, presence: true, numericality: {greater_than_or_equal_to: 10}
  validates :extra_fee, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :thumbnail, presence: true, content_type: {in: %w(image/jpeg image/gif image/png image/jpg),
                                                       message: "must be a valid image format"}
  validates :homestay_photos, presence: true, content_type: {in: %w(image/jpeg image/gif image/png image/jpg),
                                                             message: "must be a valid image format"}

  delegate :name, to: :location, prefix: true
  delegate :full_name, to: :host, prefix: true

  scope :order_by_rating, ->{left_joins(:bookings).order rating: :desc}
  scope :location, ->(district_id){where location_id: district_id}
  scope :max_guests, ->(guests){where(Settings.query.max_guests, guests)}
  scope :get_all_places, ->{select(Settings.query.all_places)}
  scope :get_bookings_by_place, ->(place_id){left_joins(:bookings).where(Settings.query.place_id, place_id)}
  scope :get_all_bookings_history, ->{select(Settings.query.all_places).joins(:bookings)}
  scope :get_by_user_id, ->(user_id){where(Settings.query.user_id, user_id)}
  scope :order_by_check_in_date, ->{order(Settings.query.order_by_check_in_date)}
  scope :get_all_bookmarks, ->(user_id){joins(:bookmarks).where(Settings.query.get_all_bookmarks, user_id)}
  scope :order_bookmarks, ->{order(Settings.query.order_bookmarks)}
  scope :get_place_number_by_city, ->{select(Settings.query.place_numb_by_city).joins(location: :city).group(:city_id)}
  scope :get_places_by_city, ->(city_id){joins(location: :city).where("cities.id = ?", city_id)}
  scope :with_attach_thumbnail, ->{includes(thumbnail_attachment: :blob)}
end

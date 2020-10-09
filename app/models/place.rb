class Place < ApplicationRecord
  has_one_attached :thumbnail
  has_many_attached :homestay_photos
  has_and_belongs_to_many :amenities
  has_and_belongs_to_many :rules
  has_many :bookings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :host, class_name: User.name, foreign_key: :host_id
  belongs_to :location, class_name: District.name, foreign_key: :location_id
end

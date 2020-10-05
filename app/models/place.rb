class Place < ApplicationRecord
  has_and_belongs_to_many :amenities
  has_and_belongs_to_many :rules
  has_many :bookings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :host, class_name: User.name, foreign_key: :host_id
  belongs_to :district
end

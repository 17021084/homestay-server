class User < ApplicationRecord
  has_one :host_information, dependent: :destroy
  has_many :places, foreign_key: :host_id, primary_key: :id, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
end

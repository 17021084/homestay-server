class City < ApplicationRecord
  has_many :districts, dependent: :destroy
  has_many :users, dependent: :destroy
end

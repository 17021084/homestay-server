class City < ApplicationRecord
  has_many :districts, dependent: :destroy
end

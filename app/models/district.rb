class District < ApplicationRecord
  has_many :places, dependent: :destroy
  belongs_to :city
end

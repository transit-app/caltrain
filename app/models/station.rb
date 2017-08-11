class Station < ApplicationRecord
  has_many :stops, dependent: :destroy
  has_many :trains, through: :stops

  geocoded_by :station_name
  after_validation :geocode
end

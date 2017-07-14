class Station < ApplicationRecord
  has_many :stops, dependent: :destroy
  has_many :trains, through: :stops
end

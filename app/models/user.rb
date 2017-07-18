class User < ApplicationRecord
  include Clearance::User
  has_many :favorites
  has_many :stops, through: :favorites
end

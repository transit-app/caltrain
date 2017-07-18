class User < ApplicationRecord
  include Clearance::User
  has_many :favorites
  has_many :stops, through: :favorites

  def has_favorite? (user_id, origin, destination)
    User.find(user_id).favorites.any? { |user_fav| user_fav.source == origin && user_fav.destination == destination}
  end
end

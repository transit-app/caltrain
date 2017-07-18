class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :stop, optional: true
  def route_name
    "#{source} to #{destination}"
  end
end

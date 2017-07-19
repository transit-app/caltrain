class StationsController < ApplicationController
  def index
    @stations = Station.all
    if current_user
      user_id = current_user.id
      @favorites = Favorite.where(user_id:user_id)
    end
  end

end

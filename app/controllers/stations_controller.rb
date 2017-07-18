class StationsController < ApplicationController
  def index
    @station = Station.new
    @stations = Station.all
    if current_user
    user_Id = current_user.id
      @favorites = Favorite.where(user_id:user_Id)
    end

  end
end

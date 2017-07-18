class StationsController < ApplicationController
  def index
    @station = Station.new
    @stations = Station.all
    user_Id = current_user.id
      @favorites = Favorite.where(user_id:user_Id)

  end
end

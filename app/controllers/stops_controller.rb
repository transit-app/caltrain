class StopsController < ApplicationController

  def index
    departure_station = Station.find(params[:from])
    arrival_station = Station.find(params[:to])

    @trip_data = Station.get_trips(departure_station, arrival_station, params[:time], params[:range])

    if current_user
      user_id = current_user.id
      @favorites = Favorite.where(user_id:user_id)
    end
  end


end

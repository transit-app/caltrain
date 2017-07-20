class StopsController < ApplicationController

  def index
    departure_station = Station.where(name: params[:from]).first
    arrival_station = Station.where(name: params[:to]).first
    @trip_data = {
      station_from: params[:from],
      station_to: params[:to],
      station_from_id: departure_station.id,
      station_to_id: arrival_station.id,
      trips: Station.get_trips(departure_station, arrival_station, params[:time], params[:range])
    }
    if current_user
      user_id = current_user.id
      @favorites = Favorite.where(user_id:user_id)
    end
  end


end

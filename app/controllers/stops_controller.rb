class StopsController < ApplicationController

  def index
    departure_stop = Station.where(name: params[:from]).first
    arrival_stop = Station.where(name: params[:to]).first
    @trip_data = {
      station_from: params[:from],
      station_to: params[:to],
      station_from_id: departure_stop.id,
      station_to_id: arrival_stop.id,
      trips: Station.get_trips(departure_stop, arrival_stop, params[:time], params[:range])
    }
    if current_user
      user_id = current_user.id
      @favorites = Favorite.where(user_id:user_id)
    end
  end


end

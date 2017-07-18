class StopsController < ApplicationController

  def index
    departure_stop = Station.where(name: params[:from]).first
    arrival_stop = Station.where(name: params[:to]).first
    @trip_data = {
      station_from: params[:from],
      station_to: params[:to],
      trips: Station.get_trips(departure_stop, arrival_stop, params[:time], params[:range])
    }
      user_Id = current_user.id
      @favorites = Favorite.where(user_id:user_Id)
  end


end

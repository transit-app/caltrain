class StopsController < ApplicationController

  def index
    departure_station = Station.find(params[:from])
    arrival_station = Station.find(params[:to])

    @trip_data = Trip.get_trips(departure_station, arrival_station, params[:time], params[:range])
  end


end

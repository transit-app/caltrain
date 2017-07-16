class StopsController < ApplicationController

  def index
    departure_stop = Station.where(name: params[:from]).first
    arrival_stop = Station.where(name: params[:to]).first
    @trips = Station.get_trips(departure_stop, arrival_stop, params[:time], params[:range])
  end

end

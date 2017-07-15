class StopsController < ApplicationController
  def index
    @stations = Station.all
    @stops = Stop.all # we have to CHANGE THIS.

    departure_stop = Station.where(name: params[:from]).first
    arrival_stop = Station.where(name: params[:to]).first

    @trips = []
    departure_stop.trains.each do |train|

      # departure_stop_confirm = train.stops.where(station: departure_stop).where("departure_time >= '5:00 PM'").first
      arrival_stop_confirm = train.stops.where(station: arrival_stop).first
      # pp arrival_stop_temp
      if arrival_stop_confirm
        stops = train.stops.where(station: departure_stop).first, arrival_stop_confirm, train
        @trips << stops.as_json
        # pp stops
      end
    end

  end
end

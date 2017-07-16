class StopsController < ApplicationController

  def index
    departure_stop = Station.where(name: params[:from]).first
    arrival_stop = Station.where(name: params[:to]).first

    time_criteria = params[:time]

    @trips = []
    departure_stop.trains.each do |train|
      departure_stop_confirm = train.stops.where(station: departure_stop).where("departure_time >= '#{time_criteria}'").first
      arrival_stop_confirm = train.stops.where(station: arrival_stop).first
      if departure_stop_confirm && arrival_stop_confirm
        direction_confirm = arrival_stop_confirm[:departure_time] > departure_stop_confirm[:departure_time]
      end
      if arrival_stop_confirm && departure_stop_confirm && direction_confirm
        stops = train.stops.where(station: departure_stop).first, arrival_stop_confirm, train
        @trips << stops.as_json
      end
    end

  end
end

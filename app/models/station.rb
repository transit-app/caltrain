class Station < ApplicationRecord
  has_many :stops, dependent: :destroy
  has_many :trains, through: :stops

  def self.get_trips (departure_stop, arrival_stop, time, range)
    time_after = time
    time_before = (time_after.to_time + (range.to_i * 60 * 60)).strftime('%I:%M%p')

    @trips = []
    departure_stop.trains.each do |train|
      departure_stop_confirm = train.stops.where(station: departure_stop).where("departure_time >= '#{time_after}' and departure_time <= '#{time_before}'").first
      arrival_stop_confirm = train.stops.where(station: arrival_stop).first
      if departure_stop_confirm && arrival_stop_confirm
        direction_confirm = arrival_stop_confirm[:departure_time] > departure_stop_confirm[:departure_time]
      end
      if arrival_stop_confirm && departure_stop_confirm && direction_confirm
        stops = train.stops.where(station: departure_stop).first, arrival_stop_confirm, train
        @trips << stops.as_json
      end
    end
    @trips
  end


end

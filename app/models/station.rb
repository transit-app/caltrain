class Station < ApplicationRecord
  has_many :stops, dependent: :destroy
  has_many :trains, through: :stops

  geocoded_by :station_name
  after_validation :geocode

  def self.get_trips (departure_stop, arrival_stop, time, range)
    time_after = time

    time_before = (time_after.to_time + (range.to_i * 60 * 60)).to_time.strftime('%I:%M%p')
      if time_before.to_time < time_after.to_time
        time_before = "11:59:59PM"
      end
    @trips = []

    departure_stop.trains.each do |train|
      departure_stop_confirm = train.stops.where(station: departure_stop).where("departure_time >= '#{time_after}' and departure_time <= '#{time_before}'").first
      arrival_stop_confirm = train.stops.where(station: arrival_stop).first
      if departure_stop_confirm && arrival_stop_confirm
        direction_confirm = arrival_stop_confirm[:id] > departure_stop_confirm[:id]
      end
      if arrival_stop_confirm && departure_stop_confirm && direction_confirm
        depart_time = departure_stop_confirm.departure_time
        arrive_time = arrival_stop_confirm.departure_time
        trip_duration = ((arrive_time - depart_time) / 60).floor
        train_id = train.id
        departure_id = departure_stop_confirm.id
        arrival_id = arrival_stop_confirm.id
        trip_stop_items = Train.find(train_id).stops.where("id >= #{departure_id} and id <= #{arrival_id}").map do |stop|

          {
            name: Station.find(stop.station_id).name,
            departure_time: stop.departure_time.to_datetime.utc.strftime("%l:%M %p")
          }
        end

        trip_item = {
          departure_time: depart_time.to_datetime.utc.strftime("%l:%M %p"),
          arrival_time: arrive_time.to_datetime.utc.strftime("%l:%M %p"),
          duration: trip_duration,
          train_number: train.train_number,
          trip_stops: trip_stop_items
        }
        @trips << trip_item
      end
    end
    @trips
  end

end

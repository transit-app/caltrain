class StopsController < ApplicationController

  def index
    @trip_data = Trip.get_trips(params)
  end


end

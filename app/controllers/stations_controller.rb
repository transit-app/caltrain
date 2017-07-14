class StationsController < ApplicationController
  def index
    @station = Station.new
    @stations = Station.all
    @stops = Stop.all
  end
end

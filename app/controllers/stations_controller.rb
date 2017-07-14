class StationsController < ApplicationController
  def index
    @station = Station.new
    @stations = Station.all
  end
end

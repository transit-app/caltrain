class AddStationNameToStations < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :station_name, :string
  end
end

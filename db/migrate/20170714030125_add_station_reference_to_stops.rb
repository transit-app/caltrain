class AddStationReferenceToStops < ActiveRecord::Migration[5.1]
  def change
    add_reference :stops, :station, foreign_key: true
  end
end

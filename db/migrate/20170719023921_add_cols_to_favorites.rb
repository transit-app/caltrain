class AddColsToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :from_station_id, :bigint
    add_column :favorites, :to_station_id, :bigint
  end
end

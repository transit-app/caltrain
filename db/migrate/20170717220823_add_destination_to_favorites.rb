class AddDestinationToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :destination, :string
  end
end

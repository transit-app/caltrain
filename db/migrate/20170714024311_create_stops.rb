class CreateStops < ActiveRecord::Migration[5.1]
  def change
    create_table :stops do |t|
      t.time :departure_time

      t.timestamps
    end
  end
end

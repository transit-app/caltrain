class AddTrainReferenceToStops < ActiveRecord::Migration[5.1]
  def change
    add_reference :stops, :train, foreign_key: true
  end
end

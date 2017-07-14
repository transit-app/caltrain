class CreateTrains < ActiveRecord::Migration[5.1]
  def change
    create_table :trains do |t|
      t.string :train_number
      t.string :direction
      t.string :service_type

      t.timestamps
    end
  end
end

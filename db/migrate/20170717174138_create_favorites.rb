class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :stop, foreign_key: true

      t.timestamps
    end
  end
end

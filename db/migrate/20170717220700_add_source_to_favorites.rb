class AddSourceToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :source, :string
  end
end

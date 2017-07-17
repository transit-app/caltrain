class FavoritesController < ApplicationController
  def index
    user_Id = current_user.id
    @favorites = Favorite.where(user_id:user_Id)
  end
end

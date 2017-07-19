class FavoritesController < ApplicationController
  def index
    if current_user
      user_id = current_user.id
      @favorites = Favorite.where(user_id:user_id)
    else
      redirect_to '/'
    end
  end

  def create
    from = params[:from]
    to = params[:to]
    from_id = params[:from_id]
    to_id = params[:to_id]
    user_id = params[:user_id].to_i
    @favorite = current_user.favorites.build({user_id:user_id, source:from, destination:to, from_station_id:from_id, to_station_id:to_id})
    if @favorite.valid? && !current_user.has_favorite?(@favorite.user_id, @favorite.source, @favorite.destination) && @favorite.save
        flash[:notice] = "Saved to Favorites!"
        redirect_to '/favorites'
    else
      @favorite = Favorite.create
      flash[:error] = "You already have that route in your favorites."
      redirect_to '/favorites'
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    flash[:error] = 'The route has been deleted from your favorites successfully.'
    redirect_to favorites_path
  end

  private

  def fav_params
       params.require(:favorite).permit(:stop_id,:user_id)
     end
end

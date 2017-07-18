class FavoritesController < ApplicationController
  def index
    user_Id = current_user.id
    @favorites = Favorite.where(user_id:user_Id)

  end

  def create
    from = params[:from]
    to = params[:to]
    user_id = params[:user_id].to_i
    @favorite = current_user.favorites.build({user_id:user_id, source:from, destination:to})
    

      if @favorite.valid? &&
          @favorite.save
          flash[:notice] = "Saved to Favorites"
          redirect_to '/favorites'

      else
        @favorite = Favorite.create
        flash[:error] = "Oops!"
        redirect_to '/'
    end
  end
  private
  def fav_params
       params.require(:favorite).permit(:stop_id,:user_id)
     end
end

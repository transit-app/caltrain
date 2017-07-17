class FavoritesController < ApplicationController
  def index
    user_Id = current_user.id
    @favorites = Favorite.where(user_id:user_Id)
  end
  # def create
  #   redirect_to '/favorites'
  # end

  def create
    stop_id = params[:stop_id].to_i
    user_id = params[:user_id].to_i
    @favorite = current_user.favorites.build({stop_id:stop_id, user_id:user_id})

      if @favorite.valid?
        @favorite.save
        redirect_to favorites_path
      else
        @favorite = Favorite.create
        flash[:error] = "Oops!" + @favorite.errors.messages[:title][0] + "."
        redirect_to '/'
        explode
    end
  end
  private
  def fav_params
       params.require(:favorite).permit(:stop_id,:user_id)
     end
end

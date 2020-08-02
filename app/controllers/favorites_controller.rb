class FavoritesController < ApplicationController
  def index
    favorites = Favorite.all

    render json: favorites
  end

  def create
    favorite = Favorite.find_or_create_by(favorite_params)

    render json: favorite
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy

    render json: favorite
  end

  def show
    favorite = Favorite.find(params[:id])
    render json: favorite
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :doctor_id, :api_id)
  end
end

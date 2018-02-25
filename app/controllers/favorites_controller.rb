class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to picture_url(id: params[:picture_id]),
      flash: { info: t('.success', user: favorite.picture.user.name) }
  end

  def destroy
    favorite = current_user.favorites.find_by(picture_id: params[:picture_id]).destroy
    redirect_to picture_url(id: params[:picture_id]),
      flash: { warning: t('.success', user: favorite.picture.user.name) }
  end
end

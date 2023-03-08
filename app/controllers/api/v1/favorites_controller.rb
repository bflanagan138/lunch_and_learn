class Api::V1::FavoritesController < ApplicationController
  def index
 
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    fav = user.favorites.create!(favorites_params)
    require 'pry'; binding.pry
  end

  def update

  end

  private
  def favorites_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end
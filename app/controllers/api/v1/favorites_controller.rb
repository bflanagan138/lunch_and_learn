class Api::V1::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
 
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      fav = user.favorites.create!(favorites_params)
      render json: { "success": "Favorite added successfully" }, status: 201 
    else
      render json: { "error": "Login credentials missing or invalid" }, status: 401 
    end
  end

  def update

  end

  private
  def favorites_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end
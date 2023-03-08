class Api::V1::FavoritesController < ApplicationController
  before_action :authenticate_user, only: :index
  skip_before_action :verify_authenticity_token

  def index
    # require 'pry'; binding.pry
    # if @user.present?
      authenticate_user
      render json: FavoriteSerializer.new(@user.favorites), status: 200
    # elsif #user email already exists
    #   render json: { "error": "Login Failure: Email already Exists" }, status: 401
    # end
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

  def authenticate_user
    @user = User.find_by(api_key: params[:api_key])
  end

  private
  def favorites_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end
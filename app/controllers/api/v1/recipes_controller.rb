class Api::V1::RecipesController < ApplicationController
  def index
    recipes = RecipeFacade.recipes_by_country(params[:q])
    render json: RecipesSerializer.new(recipes)
  end
end
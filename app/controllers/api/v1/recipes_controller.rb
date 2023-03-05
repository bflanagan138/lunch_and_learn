class Api::V1::RecipesController < ApplicationController
  def index
    country = params[:q]
    if country == nil?
      []
    elsif country != nil?
    #if country.exists? 
    recipes = RecipeFacade.recipes_by_country(country)
    #if country
    render json: RecipesSerializer.new(recipes)
  end
end
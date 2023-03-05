class Api::V1::RecipesController < ApplicationController
  def index
    country = params[:q]
    if country == ''
      render json: EmptySerializer.empty_array_response
    elsif CountriesService.exist(country) == []
      render json: EmptySerializer.empty_array_response
    else
      recipes = RecipeFacade.recipes_by_country(country)
      render json: RecipesSerializer.new(recipes)
    end
  end
end
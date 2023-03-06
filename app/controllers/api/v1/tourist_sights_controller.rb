class Api::V1::TouristSightsController < ApplicationController
  def index
    country = params[:country]
    capital_coords = CountriesService.exist(country)
    coordinates = capital_coords[0][:capitalInfo][:latlng]
    lat = coordinates[0]
    long = coordinates[1]
    
    TouristSightsService.tourist_sights(lat,long)
  end
end
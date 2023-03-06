class Api::V1::TouristSightsController < ApplicationController
  def index
    country = params[:country]
    capital_coords = CountriesService.exist(country)
    coordinates = capital_coords[0][:capitalInfo][:latlng]
    lat = coordinates[0]
    long = coordinates[1]
    TouristSightFacade.tourist_sights(lat,long)
   
    sights = TouristSightFacade.tourist_sights(lat,long)
    render json: TouristSightsSerializer.tourist_sights(sights)
  end
end
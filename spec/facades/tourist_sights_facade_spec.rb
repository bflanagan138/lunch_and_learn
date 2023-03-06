require 'rails_helper'

RSpec.describe 'tourist sights' do
  it 'returns JSON response' do
    country = 'France'
    capital_coords = CountriesService.exist(country)
    coordinates = capital_coords[0][:capitalInfo][:latlng]
    lat = coordinates[0]
    long = coordinates[1]
   
    tourist_sights = TouristSightFacade.tourist_sights(lat, long)
  
    expect(tourist_sights).to be_a Array
    tourist_sights.each do |sight|
      expect(sight.name).to be_a String
      expect(sight.address).to be_a String
      expect(sight.place_id).to be_a String
    end
  end
end
require 'rails_helper'

RSpec.describe 'tourist sights' do
  it 'returns JSON response' do
    country = 'France'
    capital_coords = CountriesService.exist(country)
    coordinates = capital_coords[0][:capitalInfo][:latlng]
    lat = coordinates[0]
    long = coordinates[1]
   
    results = TouristSightsService.tourist_sights(lat, long)

    expect(results).to have_key(:features)
    expect(results[:features]).to be_a Array
    expect(results[:features][0]).to be_a Hash
    expect(results[:features][0]).to have_key(:properties)
    expect(results[:features][0][:properties]).to be_a Hash
    expect(results[:features][0][:properties]).to have_key(:name)
    expect(results[:features][0][:properties][:name]).to be_a String
    expect(results[:features][0][:properties]).to have_key(:formatted)
    expect(results[:features][0][:properties][:formatted]).to be_a String
    expect(results[:features][0][:properties]).to have_key(:place_id)
    expect(results[:features][0][:properties][:place_id]).to be_a String
   
  end
end
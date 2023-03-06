require 'rails_helper'

RSpec.describe "tourist sights API request" do
  it 'returns a list of tourist sights from provided country' do
    country = "France"
    
    get "/api/v1/tourist_sights?country=#{country}"
    
    expect(response).to be_successful
    expect(response.status).to be 200
    
    parse = JSON.parse(response.body, symbolize_names: true)
  
    expect(parse).to be_a Hash
    expect(parse).to have_key (:data)
    expect(parse[:data]).to be_a Array
    parse[:data].each do |sight|
      expect(sight).to have_key (:id)
      expect(sight[:id]).to eq "null"
      expect(sight).to have_key (:type)
      expect(sight[:type]).to eq ("touristsight")
      expect(sight).to have_key (:attributes)
      expect(sight[:attributes]).to be_a Hash
      expect(sight[:attributes]).to have_key (:name)
      expect(sight[:attributes][:name]).to be_a String
      expect(sight[:attributes]).to have_key (:address)
      expect(sight[:attributes][:address]).to be_a String
      expect(sight[:attributes]).to have_key (:place_id)
      expect(sight[:attributes][:place_id]).to be_a String
      end
  end
end
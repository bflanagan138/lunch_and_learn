require 'rails_helper'

RSpec.describe "recipe API request" do
  it 'returns a list of recipes from provided country' do
    # recipe_response = File.read('spec/fixtures/country_recipes.json')
    # country_response = File.read('spec/fixtures/country.json')
    # country = 'Vatican'
    
    # stub_request(:get, "https://api.edamam.com/api/recipes/v2?q=#{country}&app_id=#{ENV['edamam_app_id']}&app_key=#{ENV['edamam_app_key']}&type=#{ENV['edamam_type']}")
    # .to_return(status: 200, body: recipe_response)
    # stub_request(:get, "https://restcountries.com/v3.1/name/#{country}")
    # .to_return(status: 200, body: country_response)
    country = "Vatican"
    get "/api/v1/recipes?country=#{country}"
    
    expect(response).to be_successful
    expect(response.status).to be 200
    
    parse = JSON.parse(response.body, symbolize_names: true)
    
    expect(parse).to be_a Hash
    expect(parse).to have_key (:data)
    expect(parse[:data]).to be_a Array
    parse[:data].each do |recipe|
      expect(recipe).to have_key (:id)
      expect(recipe[:id]).to eq nil
      expect(recipe).to have_key (:type)
      expect(recipe[:type]).to eq ("recipes")
      expect(recipe).to have_key (:attributes)
      expect(recipe[:attributes]).to be_a Hash
      expect(recipe[:attributes]).to have_key (:title)
      expect(recipe[:attributes][:title]).to be_a String
      expect(recipe[:attributes]).to have_key (:url)
      expect(recipe[:attributes][:url]).to be_a String
      expect(recipe[:attributes]).to have_key (:country)
      expect(recipe[:attributes][:country]).to be_a String
      expect(recipe[:attributes][:country]).to eq ("#{country}").downcase.capitalize
      expect(recipe[:attributes]).to have_key (:image_url)
      expect(recipe[:attributes][:image_url]).to be_a String
      expect(recipe[:attributes].count).to eq (4)
      expect(recipe[:attributes].keys).to eq ([:title, :url, :country, :image_url])
    end
  end

  it 'returns an empty array if no country name is provided' do
    country = ''
   
    get "/api/v1/recipes/?country=#{country}"
    parse = JSON.parse(response.body, symbolize_names: true)
  
    expect(parse).to be_a Hash
    expect(parse).to have_key (:data)
    expect(parse[:data]).to be_a Array
    expect(parse[:data]).to eq ([])
  end
  
  it 'returns an empty array if non country name is provided' do
    country = 'Dirty Work'
    get "/api/v1/recipes?country=#{country}"
    
    parse = JSON.parse(response.body, symbolize_names: true)
  
    expect(parse).to be_a Hash
    expect(parse).to have_key (:data)
    expect(parse[:data]).to be_a Array
    expect(parse[:data]).to eq ([])
  end
end
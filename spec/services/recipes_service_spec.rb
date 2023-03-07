require 'rails_helper'

RSpec.describe 'recipes' do
  it 'returns JSON response' do
    country = 'Denmark'
    country_response = File.read('spec/fixtures/denmark.json')
    recipe_response = File.read('spec/fixtures/country_recipes.json')
 
    stub_request(:get, "https://restcountries.com/v3.1/name/#{country}")
      .to_return(status: 200, body: country_response)
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?q=#{country}&app_id=#{ENV['edamam_app_id']}&app_key=#{ENV['edamam_app_key']}&type=#{ENV['edamam_type']}")
        .to_return(status: 200, body: recipe_response)

    results = RecipesService.recipes_by_country(country)
 
    expect(results).to have_key(:hits)
    expect(results[:hits]).to be_a Array
    expect(results[:hits][0]).to be_a Hash
    expect(results[:hits][0]).to have_key(:recipe)
    expect(results[:hits][0][:recipe]).to be_a Hash
    expect(results[:hits][0][:recipe]).to have_key(:url)
    expect(results[:hits][0][:recipe][:url]).to be_a String
    expect(results[:hits][0][:recipe]).to have_key(:label)
    expect(results[:hits][0][:recipe][:label]).to be_a String
    expect(results[:hits][0][:recipe]).to have_key(:image)
    expect(results[:hits][0][:recipe][:image]).to be_a String
    expect(results[:hits][0][:recipe]).to have_key(:images)
    expect(results[:hits][0][:recipe][:images]).to be_a Hash
    expect(results[:hits][0][:recipe][:images]).to have_key(:THUMBNAIL)
    expect(results[:hits][0][:recipe][:images][:THUMBNAIL]).to be_a Hash
  end
end
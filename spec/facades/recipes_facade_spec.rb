require 'rails_helper'

RSpec.describe 'recipes' do
  it 'returns JSON response' do
    country = 'Estonia'
    country_response = File.read('spec/fixtures/denmark.json')
    recipe_response = File.read('spec/fixtures/country_recipes.json')
 
    stub_request(:get, "https://restcountries.com/v3.1/name/#{country}")
      .to_return(status: 200, body: country_response)
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?q=#{country}&app_id=#{ENV['edamam_app_id']}&app_key=#{ENV['edamam_app_key']}&type=#{ENV['edamam_type']}")
        .to_return(status: 200, body: recipe_response)

    recipes = RecipeFacade.recipes_by_country(country)
    
    expect(recipes).to be_a Array
    recipes.each do |recipe|
      expect(recipe.country).to eq "Estonia"
      expect(recipe.title).to be_a String
      expect(recipe.url).to be_a String
      expect(recipe.image_url).to be_a String
    end
  end
end
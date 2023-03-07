require 'rails_helper'

RSpec.describe 'recipes' do
  it 'returns JSON response' do
    country = 'Estonia'
    country_response = File.read('spec/fixtures/denmark.json')
    
 
    stub_request(:get, "https://restcountries.com/v3.1/name/#{country}")
      .to_return(status: 200, body: country_response)
   

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
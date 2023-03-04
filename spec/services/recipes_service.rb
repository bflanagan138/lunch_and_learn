require 'rails_helper'

RSpec.describe 'recipes' do
  it 'returns JSON response' do
    country = 'estonia'
    results = RecipesService.recipes_by_country(country)
    expect(results).to have_key(:hits)
    expect(results[:hits]).to be_a Array
    expect(results[:hits][0]).to be_a Hash
    expect(results[:hits][0]).to have_key(:recipe)
    expect(results[:hits][0][:recipe]).to be_a Hash
    expect(results[:hits][0][:recipe]).to have_key(:uri)
    expect(results[:hits][0][:recipe][:uri]).to be_a String
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
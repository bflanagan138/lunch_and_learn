require 'rails_helper'

RSpec.describe 'videos' do
  it 'returns JSON response' do
    country = 'estonia'
    results = VideosService.videos(country)
    
    expect(results).to have_key(:items)
    expect(results[:items]).to be_a Array
    expect(results[:items][0]).to be_a Hash
    expect(results[:items][0]).to have_key(:snippet)
    expect(results[:items][0][:snippet]).to be_a Hash
    expect(results[:items][0][:snippet]).to have_key(:title)
    expect(results[:items][0][:snippet][:title]).to be_a String
    expect(results[:items][0]).to have_key(:id)
    expect(results[:items][0][:id]).to be_a Hash
    expect(results[:items][0][:id]).to have_key(:videoId)
    expect(results[:items][0][:id][:videoId]).to be_a String
  end
end
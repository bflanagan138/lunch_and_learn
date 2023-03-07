require 'rails_helper'

RSpec.describe 'images' do
  it 'returns JSON response' do
    country = 'Estonia'
    images_response = File.read('spec/fixtures/country_images.json')
    country_response = File.read('spec/fixtures/country.json')
    
    stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['unsplash_client_id']}&query=#{country}")
    .to_return(status: 200, body: images_response)
    stub_request(:get, "https://restcountries.com/v3.1/name/#{country}")
      .to_return(status: 200, body: country_response)

    results = ImagesService.images_by_country(country)

    expect(results).to be_a Hash
    expect(results).to have_key(:results)
    results[:results].map do |result| 
      expect(result).to be_a Hash
      expect(result).to have_key(:alt_description)
      expect(result).to have_key(:urls)
      expect(result[:urls]).to be_a Hash
      expect(result[:urls]).to have_key(:raw)
    end
  end
end
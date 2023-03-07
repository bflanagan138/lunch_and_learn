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

    images = ImageFacade.images_by_country(country)

    expect(images).to be_a Array
    expect(images.count).to be <= 10
    images.each do |image|
      
      expect(image).to be_a Image
      if image.alt_tag != nil
        expect(image.alt_tag).to be_a String
      end
      expect(image.url).to be_a String
    end
  end
end
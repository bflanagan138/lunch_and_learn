require 'rails_helper'

RSpec.describe 'images' do
  it 'returns JSON response' do
    country = 'Estonia'
    results = ImagesService.images_by_country(country)

    expect(results).to be_a Hash
    expect(results).to have_key(:results)
    results[:results].map do |result| 
      expect(result).to be_a Hash
      expect(result).to have_key(:description)
      expect(result[:description]).to be_a String
      expect(result).to have_key(:alt_description)
      expect(result[:alt_description]).to be_a String
    end
  end
end

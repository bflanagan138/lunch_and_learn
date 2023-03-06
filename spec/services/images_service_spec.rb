require 'rails_helper'

RSpec.describe 'images' do
  it 'returns JSON response' do
    country = 'Estonia'
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
require 'rails_helper'

RSpec.describe 'images' do
  it 'returns JSON response' do
    country = 'Estonia'
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
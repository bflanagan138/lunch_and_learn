require 'rails_helper'

RSpec.describe 'countries' do
  it 'returns random country name' do
    random_country_1 = CountriesService.random_country
    random_country_2 = CountriesService.random_country
    
    expect(random_country_1).to be_a String
    expect(random_country_1).to_not eq (random_country_2)
  end

  it 'returns name of country if it exists' do
    country = "Peru"
    real_country = CountriesService.exist(country)[0][:name][:common]
    
    expect(real_country).to eq ("Peru")
  end

  it 'returns an empty array if country does not exist' do
    country = "Dirty Work"
    fake_country = CountriesService.exist(country)
    
    expect(fake_country).to eq ([])
  end
end
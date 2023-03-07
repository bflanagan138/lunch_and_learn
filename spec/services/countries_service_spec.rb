require 'rails_helper'

RSpec.describe 'countries' do
  it 'returns random country name' do
    country_1_response = File.read('spec/fixtures/denmark.json')
    country_1 = "Denmark"
    stub_request(:get, "https://restcountries.com/v3.1/all")
      .to_return(status: 200, body: country_1_response)
    random_country_1 = CountriesService.random_country
    
    country_2_response = File.read('spec/fixtures/germany.json')
    country_2 = "Germany"
    stub_request(:get, "https://restcountries.com/v3.1/all")
      .to_return(status: 200, body: country_2_response)
    random_country_2 = CountriesService.random_country
   
    expect(random_country_1).to be_a Hash
    expect(random_country_2).to be_a Hash
    expect(random_country_1).to_not eq (random_country_2)
    expect(random_country_1[:name][:common]).to eq ("Denmark")
    expect(random_country_2[:name][:common]).to eq ("Germany")
  end

  it 'returns name of country if it exists' do
    country = "Vatican"
    country_response = File.read('spec/fixtures/country.json')
    stub_request(:get, "https://restcountries.com/v3.1/name/#{country}")
      .to_return(status: 200, body: country_response)
 
    real_country = CountriesService.exist(country)
    
    expect(real_country[0][:name][:common]).to eq ("Vatican City")
  end

  it 'returns an empty array if country does not exist' do
    country = "neptune"
    country_response = File.read('spec/fixtures/non_country.json')
    stub_request(:get, "https://restcountries.com/v3.1/name/#{country}")
      .to_return(status: 200, body: country_response)

    fake_country = CountriesService.exist(country)
   
    expect(fake_country).to eq ([])
  end
end